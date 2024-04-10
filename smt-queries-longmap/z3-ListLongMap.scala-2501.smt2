; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38826 () Bool)

(assert start!38826)

(declare-fun b!405299 () Bool)

(declare-fun e!243714 () Bool)

(declare-fun e!243713 () Bool)

(declare-fun mapRes!16989 () Bool)

(assert (=> b!405299 (= e!243714 (and e!243713 mapRes!16989))))

(declare-fun condMapEmpty!16989 () Bool)

(declare-datatypes ((V!14765 0))(
  ( (V!14766 (val!5167 Int)) )
))
(declare-datatypes ((ValueCell!4779 0))(
  ( (ValueCellFull!4779 (v!7414 V!14765)) (EmptyCell!4779) )
))
(declare-datatypes ((array!24381 0))(
  ( (array!24382 (arr!11640 (Array (_ BitVec 32) ValueCell!4779)) (size!11992 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24381)

(declare-fun mapDefault!16989 () ValueCell!4779)

(assert (=> b!405299 (= condMapEmpty!16989 (= (arr!11640 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4779)) mapDefault!16989)))))

(declare-fun mapIsEmpty!16989 () Bool)

(assert (=> mapIsEmpty!16989 mapRes!16989))

(declare-fun b!405300 () Bool)

(declare-fun res!233898 () Bool)

(declare-fun e!243711 () Bool)

(assert (=> b!405300 (=> (not res!233898) (not e!243711))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405300 (= res!233898 (validMask!0 mask!1025))))

(declare-fun b!405301 () Bool)

(declare-fun res!233907 () Bool)

(assert (=> b!405301 (=> (not res!233907) (not e!243711))))

(declare-datatypes ((array!24383 0))(
  ( (array!24384 (arr!11641 (Array (_ BitVec 32) (_ BitVec 64))) (size!11993 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24383)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24383 (_ BitVec 32)) Bool)

(assert (=> b!405301 (= res!233907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!233902 () Bool)

(assert (=> start!38826 (=> (not res!233902) (not e!243711))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38826 (= res!233902 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11993 _keys!709))))))

(assert (=> start!38826 e!243711))

(assert (=> start!38826 true))

(declare-fun array_inv!8508 (array!24381) Bool)

(assert (=> start!38826 (and (array_inv!8508 _values!549) e!243714)))

(declare-fun array_inv!8509 (array!24383) Bool)

(assert (=> start!38826 (array_inv!8509 _keys!709)))

(declare-fun b!405302 () Bool)

(declare-fun res!233903 () Bool)

(assert (=> b!405302 (=> (not res!233903) (not e!243711))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405302 (= res!233903 (and (= (size!11992 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11993 _keys!709) (size!11992 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405303 () Bool)

(declare-fun res!233904 () Bool)

(assert (=> b!405303 (=> (not res!233904) (not e!243711))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405303 (= res!233904 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11993 _keys!709))))))

(declare-fun b!405304 () Bool)

(declare-fun res!233899 () Bool)

(assert (=> b!405304 (=> (not res!233899) (not e!243711))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405304 (= res!233899 (validKeyInArray!0 k0!794))))

(declare-fun b!405305 () Bool)

(declare-fun e!243709 () Bool)

(assert (=> b!405305 (= e!243711 e!243709)))

(declare-fun res!233901 () Bool)

(assert (=> b!405305 (=> (not res!233901) (not e!243709))))

(declare-fun lt!188315 () array!24383)

(assert (=> b!405305 (= res!233901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188315 mask!1025))))

(assert (=> b!405305 (= lt!188315 (array!24384 (store (arr!11641 _keys!709) i!563 k0!794) (size!11993 _keys!709)))))

(declare-fun mapNonEmpty!16989 () Bool)

(declare-fun tp!33108 () Bool)

(declare-fun e!243712 () Bool)

(assert (=> mapNonEmpty!16989 (= mapRes!16989 (and tp!33108 e!243712))))

(declare-fun mapRest!16989 () (Array (_ BitVec 32) ValueCell!4779))

(declare-fun mapKey!16989 () (_ BitVec 32))

(declare-fun mapValue!16989 () ValueCell!4779)

(assert (=> mapNonEmpty!16989 (= (arr!11640 _values!549) (store mapRest!16989 mapKey!16989 mapValue!16989))))

(declare-fun b!405306 () Bool)

(declare-fun tp_is_empty!10245 () Bool)

(assert (=> b!405306 (= e!243713 tp_is_empty!10245)))

(declare-fun b!405307 () Bool)

(assert (=> b!405307 (= e!243709 false)))

(declare-fun lt!188314 () Bool)

(declare-datatypes ((List!6770 0))(
  ( (Nil!6767) (Cons!6766 (h!7622 (_ BitVec 64)) (t!11944 List!6770)) )
))
(declare-fun arrayNoDuplicates!0 (array!24383 (_ BitVec 32) List!6770) Bool)

(assert (=> b!405307 (= lt!188314 (arrayNoDuplicates!0 lt!188315 #b00000000000000000000000000000000 Nil!6767))))

(declare-fun b!405308 () Bool)

(assert (=> b!405308 (= e!243712 tp_is_empty!10245)))

(declare-fun b!405309 () Bool)

(declare-fun res!233900 () Bool)

(assert (=> b!405309 (=> (not res!233900) (not e!243711))))

(assert (=> b!405309 (= res!233900 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6767))))

(declare-fun b!405310 () Bool)

(declare-fun res!233905 () Bool)

(assert (=> b!405310 (=> (not res!233905) (not e!243711))))

(assert (=> b!405310 (= res!233905 (or (= (select (arr!11641 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11641 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405311 () Bool)

(declare-fun res!233906 () Bool)

(assert (=> b!405311 (=> (not res!233906) (not e!243711))))

(declare-fun arrayContainsKey!0 (array!24383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405311 (= res!233906 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38826 res!233902) b!405300))

(assert (= (and b!405300 res!233898) b!405302))

(assert (= (and b!405302 res!233903) b!405301))

(assert (= (and b!405301 res!233907) b!405309))

(assert (= (and b!405309 res!233900) b!405303))

(assert (= (and b!405303 res!233904) b!405304))

(assert (= (and b!405304 res!233899) b!405310))

(assert (= (and b!405310 res!233905) b!405311))

(assert (= (and b!405311 res!233906) b!405305))

(assert (= (and b!405305 res!233901) b!405307))

(assert (= (and b!405299 condMapEmpty!16989) mapIsEmpty!16989))

(assert (= (and b!405299 (not condMapEmpty!16989)) mapNonEmpty!16989))

(get-info :version)

(assert (= (and mapNonEmpty!16989 ((_ is ValueCellFull!4779) mapValue!16989)) b!405308))

(assert (= (and b!405299 ((_ is ValueCellFull!4779) mapDefault!16989)) b!405306))

(assert (= start!38826 b!405299))

(declare-fun m!397807 () Bool)

(assert (=> b!405309 m!397807))

(declare-fun m!397809 () Bool)

(assert (=> mapNonEmpty!16989 m!397809))

(declare-fun m!397811 () Bool)

(assert (=> start!38826 m!397811))

(declare-fun m!397813 () Bool)

(assert (=> start!38826 m!397813))

(declare-fun m!397815 () Bool)

(assert (=> b!405305 m!397815))

(declare-fun m!397817 () Bool)

(assert (=> b!405305 m!397817))

(declare-fun m!397819 () Bool)

(assert (=> b!405300 m!397819))

(declare-fun m!397821 () Bool)

(assert (=> b!405307 m!397821))

(declare-fun m!397823 () Bool)

(assert (=> b!405304 m!397823))

(declare-fun m!397825 () Bool)

(assert (=> b!405310 m!397825))

(declare-fun m!397827 () Bool)

(assert (=> b!405301 m!397827))

(declare-fun m!397829 () Bool)

(assert (=> b!405311 m!397829))

(check-sat (not b!405309) (not start!38826) (not b!405301) (not b!405307) (not mapNonEmpty!16989) (not b!405305) (not b!405300) (not b!405311) (not b!405304) tp_is_empty!10245)
(check-sat)
