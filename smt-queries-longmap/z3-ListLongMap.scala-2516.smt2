; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38916 () Bool)

(assert start!38916)

(declare-fun b!407054 () Bool)

(declare-fun res!235255 () Bool)

(declare-fun e!244520 () Bool)

(assert (=> b!407054 (=> (not res!235255) (not e!244520))))

(declare-datatypes ((array!24553 0))(
  ( (array!24554 (arr!11726 (Array (_ BitVec 32) (_ BitVec 64))) (size!12078 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24553)

(declare-datatypes ((List!6805 0))(
  ( (Nil!6802) (Cons!6801 (h!7657 (_ BitVec 64)) (t!11979 List!6805)) )
))
(declare-fun arrayNoDuplicates!0 (array!24553 (_ BitVec 32) List!6805) Bool)

(assert (=> b!407054 (= res!235255 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6802))))

(declare-fun res!235253 () Bool)

(assert (=> start!38916 (=> (not res!235253) (not e!244520))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38916 (= res!235253 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12078 _keys!709))))))

(assert (=> start!38916 e!244520))

(assert (=> start!38916 true))

(declare-datatypes ((V!14885 0))(
  ( (V!14886 (val!5212 Int)) )
))
(declare-datatypes ((ValueCell!4824 0))(
  ( (ValueCellFull!4824 (v!7459 V!14885)) (EmptyCell!4824) )
))
(declare-datatypes ((array!24555 0))(
  ( (array!24556 (arr!11727 (Array (_ BitVec 32) ValueCell!4824)) (size!12079 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24555)

(declare-fun e!244523 () Bool)

(declare-fun array_inv!8558 (array!24555) Bool)

(assert (=> start!38916 (and (array_inv!8558 _values!549) e!244523)))

(declare-fun array_inv!8559 (array!24553) Bool)

(assert (=> start!38916 (array_inv!8559 _keys!709)))

(declare-fun b!407055 () Bool)

(declare-fun res!235256 () Bool)

(assert (=> b!407055 (=> (not res!235256) (not e!244520))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24553 (_ BitVec 32)) Bool)

(assert (=> b!407055 (= res!235256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407056 () Bool)

(declare-fun e!244524 () Bool)

(declare-fun tp_is_empty!10335 () Bool)

(assert (=> b!407056 (= e!244524 tp_is_empty!10335)))

(declare-fun b!407057 () Bool)

(declare-fun res!235248 () Bool)

(assert (=> b!407057 (=> (not res!235248) (not e!244520))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407057 (= res!235248 (and (= (size!12079 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12078 _keys!709) (size!12079 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407058 () Bool)

(declare-fun e!244519 () Bool)

(assert (=> b!407058 (= e!244520 e!244519)))

(declare-fun res!235252 () Bool)

(assert (=> b!407058 (=> (not res!235252) (not e!244519))))

(declare-fun lt!188584 () array!24553)

(assert (=> b!407058 (= res!235252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188584 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407058 (= lt!188584 (array!24554 (store (arr!11726 _keys!709) i!563 k0!794) (size!12078 _keys!709)))))

(declare-fun mapNonEmpty!17124 () Bool)

(declare-fun mapRes!17124 () Bool)

(declare-fun tp!33243 () Bool)

(assert (=> mapNonEmpty!17124 (= mapRes!17124 (and tp!33243 e!244524))))

(declare-fun mapKey!17124 () (_ BitVec 32))

(declare-fun mapValue!17124 () ValueCell!4824)

(declare-fun mapRest!17124 () (Array (_ BitVec 32) ValueCell!4824))

(assert (=> mapNonEmpty!17124 (= (arr!11727 _values!549) (store mapRest!17124 mapKey!17124 mapValue!17124))))

(declare-fun b!407059 () Bool)

(declare-fun res!235251 () Bool)

(assert (=> b!407059 (=> (not res!235251) (not e!244520))))

(assert (=> b!407059 (= res!235251 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12078 _keys!709))))))

(declare-fun mapIsEmpty!17124 () Bool)

(assert (=> mapIsEmpty!17124 mapRes!17124))

(declare-fun b!407060 () Bool)

(declare-fun e!244521 () Bool)

(assert (=> b!407060 (= e!244521 tp_is_empty!10335)))

(declare-fun b!407061 () Bool)

(assert (=> b!407061 (= e!244519 false)))

(declare-fun lt!188585 () Bool)

(assert (=> b!407061 (= lt!188585 (arrayNoDuplicates!0 lt!188584 #b00000000000000000000000000000000 Nil!6802))))

(declare-fun b!407062 () Bool)

(declare-fun res!235257 () Bool)

(assert (=> b!407062 (=> (not res!235257) (not e!244520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407062 (= res!235257 (validKeyInArray!0 k0!794))))

(declare-fun b!407063 () Bool)

(assert (=> b!407063 (= e!244523 (and e!244521 mapRes!17124))))

(declare-fun condMapEmpty!17124 () Bool)

(declare-fun mapDefault!17124 () ValueCell!4824)

(assert (=> b!407063 (= condMapEmpty!17124 (= (arr!11727 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4824)) mapDefault!17124)))))

(declare-fun b!407064 () Bool)

(declare-fun res!235254 () Bool)

(assert (=> b!407064 (=> (not res!235254) (not e!244520))))

(declare-fun arrayContainsKey!0 (array!24553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407064 (= res!235254 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407065 () Bool)

(declare-fun res!235250 () Bool)

(assert (=> b!407065 (=> (not res!235250) (not e!244520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407065 (= res!235250 (validMask!0 mask!1025))))

(declare-fun b!407066 () Bool)

(declare-fun res!235249 () Bool)

(assert (=> b!407066 (=> (not res!235249) (not e!244520))))

(assert (=> b!407066 (= res!235249 (or (= (select (arr!11726 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11726 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38916 res!235253) b!407065))

(assert (= (and b!407065 res!235250) b!407057))

(assert (= (and b!407057 res!235248) b!407055))

(assert (= (and b!407055 res!235256) b!407054))

(assert (= (and b!407054 res!235255) b!407059))

(assert (= (and b!407059 res!235251) b!407062))

(assert (= (and b!407062 res!235257) b!407066))

(assert (= (and b!407066 res!235249) b!407064))

(assert (= (and b!407064 res!235254) b!407058))

(assert (= (and b!407058 res!235252) b!407061))

(assert (= (and b!407063 condMapEmpty!17124) mapIsEmpty!17124))

(assert (= (and b!407063 (not condMapEmpty!17124)) mapNonEmpty!17124))

(get-info :version)

(assert (= (and mapNonEmpty!17124 ((_ is ValueCellFull!4824) mapValue!17124)) b!407056))

(assert (= (and b!407063 ((_ is ValueCellFull!4824) mapDefault!17124)) b!407060))

(assert (= start!38916 b!407063))

(declare-fun m!398887 () Bool)

(assert (=> mapNonEmpty!17124 m!398887))

(declare-fun m!398889 () Bool)

(assert (=> b!407065 m!398889))

(declare-fun m!398891 () Bool)

(assert (=> start!38916 m!398891))

(declare-fun m!398893 () Bool)

(assert (=> start!38916 m!398893))

(declare-fun m!398895 () Bool)

(assert (=> b!407061 m!398895))

(declare-fun m!398897 () Bool)

(assert (=> b!407066 m!398897))

(declare-fun m!398899 () Bool)

(assert (=> b!407055 m!398899))

(declare-fun m!398901 () Bool)

(assert (=> b!407062 m!398901))

(declare-fun m!398903 () Bool)

(assert (=> b!407054 m!398903))

(declare-fun m!398905 () Bool)

(assert (=> b!407064 m!398905))

(declare-fun m!398907 () Bool)

(assert (=> b!407058 m!398907))

(declare-fun m!398909 () Bool)

(assert (=> b!407058 m!398909))

(check-sat (not start!38916) (not b!407058) (not b!407061) (not b!407054) (not b!407055) tp_is_empty!10335 (not mapNonEmpty!17124) (not b!407064) (not b!407065) (not b!407062))
(check-sat)
