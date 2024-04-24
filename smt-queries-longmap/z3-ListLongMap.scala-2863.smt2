; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41220 () Bool)

(assert start!41220)

(declare-fun b_free!11077 () Bool)

(declare-fun b_next!11077 () Bool)

(assert (=> start!41220 (= b_free!11077 (not b_next!11077))))

(declare-fun tp!39070 () Bool)

(declare-fun b_and!19407 () Bool)

(assert (=> start!41220 (= tp!39070 b_and!19407)))

(declare-fun res!275858 () Bool)

(declare-fun e!268991 () Bool)

(assert (=> start!41220 (=> (not res!275858) (not e!268991))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28624 0))(
  ( (array!28625 (arr!13751 (Array (_ BitVec 32) (_ BitVec 64))) (size!14103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28624)

(assert (=> start!41220 (= res!275858 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14103 _keys!709))))))

(assert (=> start!41220 e!268991))

(declare-fun tp_is_empty!12415 () Bool)

(assert (=> start!41220 tp_is_empty!12415))

(assert (=> start!41220 tp!39070))

(assert (=> start!41220 true))

(declare-datatypes ((V!17659 0))(
  ( (V!17660 (val!6252 Int)) )
))
(declare-datatypes ((ValueCell!5864 0))(
  ( (ValueCellFull!5864 (v!8535 V!17659)) (EmptyCell!5864) )
))
(declare-datatypes ((array!28626 0))(
  ( (array!28627 (arr!13752 (Array (_ BitVec 32) ValueCell!5864)) (size!14104 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28626)

(declare-fun e!268990 () Bool)

(declare-fun array_inv!10028 (array!28626) Bool)

(assert (=> start!41220 (and (array_inv!10028 _values!549) e!268990)))

(declare-fun array_inv!10029 (array!28624) Bool)

(assert (=> start!41220 (array_inv!10029 _keys!709)))

(declare-fun b!461184 () Bool)

(declare-fun res!275859 () Bool)

(assert (=> b!461184 (=> (not res!275859) (not e!268991))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461184 (= res!275859 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20275 () Bool)

(declare-fun mapRes!20275 () Bool)

(declare-fun tp!39069 () Bool)

(declare-fun e!268988 () Bool)

(assert (=> mapNonEmpty!20275 (= mapRes!20275 (and tp!39069 e!268988))))

(declare-fun mapRest!20275 () (Array (_ BitVec 32) ValueCell!5864))

(declare-fun mapValue!20275 () ValueCell!5864)

(declare-fun mapKey!20275 () (_ BitVec 32))

(assert (=> mapNonEmpty!20275 (= (arr!13752 _values!549) (store mapRest!20275 mapKey!20275 mapValue!20275))))

(declare-fun b!461185 () Bool)

(declare-fun e!268994 () Bool)

(assert (=> b!461185 (= e!268991 e!268994)))

(declare-fun res!275853 () Bool)

(assert (=> b!461185 (=> (not res!275853) (not e!268994))))

(declare-fun lt!208943 () array!28624)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28624 (_ BitVec 32)) Bool)

(assert (=> b!461185 (= res!275853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208943 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461185 (= lt!208943 (array!28625 (store (arr!13751 _keys!709) i!563 k0!794) (size!14103 _keys!709)))))

(declare-fun b!461186 () Bool)

(declare-fun e!268992 () Bool)

(assert (=> b!461186 (= e!268990 (and e!268992 mapRes!20275))))

(declare-fun condMapEmpty!20275 () Bool)

(declare-fun mapDefault!20275 () ValueCell!5864)

(assert (=> b!461186 (= condMapEmpty!20275 (= (arr!13752 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5864)) mapDefault!20275)))))

(declare-fun b!461187 () Bool)

(declare-fun res!275861 () Bool)

(assert (=> b!461187 (=> (not res!275861) (not e!268991))))

(assert (=> b!461187 (= res!275861 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14103 _keys!709))))))

(declare-fun b!461188 () Bool)

(assert (=> b!461188 (= e!268988 tp_is_empty!12415)))

(declare-fun b!461189 () Bool)

(declare-fun e!268989 () Bool)

(assert (=> b!461189 (= e!268994 e!268989)))

(declare-fun res!275863 () Bool)

(assert (=> b!461189 (=> (not res!275863) (not e!268989))))

(assert (=> b!461189 (= res!275863 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17659)

(declare-datatypes ((tuple2!8180 0))(
  ( (tuple2!8181 (_1!4101 (_ BitVec 64)) (_2!4101 V!17659)) )
))
(declare-datatypes ((List!8242 0))(
  ( (Nil!8239) (Cons!8238 (h!9094 tuple2!8180) (t!14176 List!8242)) )
))
(declare-datatypes ((ListLongMap!7095 0))(
  ( (ListLongMap!7096 (toList!3563 List!8242)) )
))
(declare-fun lt!208940 () ListLongMap!7095)

(declare-fun lt!208944 () array!28626)

(declare-fun getCurrentListMapNoExtraKeys!1790 (array!28624 array!28626 (_ BitVec 32) (_ BitVec 32) V!17659 V!17659 (_ BitVec 32) Int) ListLongMap!7095)

(assert (=> b!461189 (= lt!208940 (getCurrentListMapNoExtraKeys!1790 lt!208943 lt!208944 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17659)

(assert (=> b!461189 (= lt!208944 (array!28627 (store (arr!13752 _values!549) i!563 (ValueCellFull!5864 v!412)) (size!14104 _values!549)))))

(declare-fun lt!208941 () ListLongMap!7095)

(assert (=> b!461189 (= lt!208941 (getCurrentListMapNoExtraKeys!1790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461190 () Bool)

(declare-fun res!275855 () Bool)

(assert (=> b!461190 (=> (not res!275855) (not e!268991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461190 (= res!275855 (validMask!0 mask!1025))))

(declare-fun b!461191 () Bool)

(declare-fun res!275856 () Bool)

(assert (=> b!461191 (=> (not res!275856) (not e!268994))))

(assert (=> b!461191 (= res!275856 (bvsle from!863 i!563))))

(declare-fun b!461192 () Bool)

(declare-fun res!275851 () Bool)

(assert (=> b!461192 (=> (not res!275851) (not e!268991))))

(declare-datatypes ((List!8243 0))(
  ( (Nil!8240) (Cons!8239 (h!9095 (_ BitVec 64)) (t!14177 List!8243)) )
))
(declare-fun arrayNoDuplicates!0 (array!28624 (_ BitVec 32) List!8243) Bool)

(assert (=> b!461192 (= res!275851 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8240))))

(declare-fun b!461193 () Bool)

(assert (=> b!461193 (= e!268992 tp_is_empty!12415)))

(declare-fun mapIsEmpty!20275 () Bool)

(assert (=> mapIsEmpty!20275 mapRes!20275))

(declare-fun b!461194 () Bool)

(declare-fun res!275860 () Bool)

(assert (=> b!461194 (=> (not res!275860) (not e!268991))))

(assert (=> b!461194 (= res!275860 (and (= (size!14104 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14103 _keys!709) (size!14104 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461195 () Bool)

(declare-fun res!275852 () Bool)

(assert (=> b!461195 (=> (not res!275852) (not e!268991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461195 (= res!275852 (validKeyInArray!0 k0!794))))

(declare-fun b!461196 () Bool)

(declare-fun res!275862 () Bool)

(assert (=> b!461196 (=> (not res!275862) (not e!268994))))

(assert (=> b!461196 (= res!275862 (arrayNoDuplicates!0 lt!208943 #b00000000000000000000000000000000 Nil!8240))))

(declare-fun b!461197 () Bool)

(declare-fun res!275857 () Bool)

(assert (=> b!461197 (=> (not res!275857) (not e!268991))))

(assert (=> b!461197 (= res!275857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461198 () Bool)

(assert (=> b!461198 (= e!268989 (not true))))

(declare-fun +!1638 (ListLongMap!7095 tuple2!8180) ListLongMap!7095)

(assert (=> b!461198 (= (getCurrentListMapNoExtraKeys!1790 lt!208943 lt!208944 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1638 (getCurrentListMapNoExtraKeys!1790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8181 k0!794 v!412)))))

(declare-datatypes ((Unit!13420 0))(
  ( (Unit!13421) )
))
(declare-fun lt!208942 () Unit!13420)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!792 (array!28624 array!28626 (_ BitVec 32) (_ BitVec 32) V!17659 V!17659 (_ BitVec 32) (_ BitVec 64) V!17659 (_ BitVec 32) Int) Unit!13420)

(assert (=> b!461198 (= lt!208942 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461199 () Bool)

(declare-fun res!275854 () Bool)

(assert (=> b!461199 (=> (not res!275854) (not e!268991))))

(assert (=> b!461199 (= res!275854 (or (= (select (arr!13751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41220 res!275858) b!461190))

(assert (= (and b!461190 res!275855) b!461194))

(assert (= (and b!461194 res!275860) b!461197))

(assert (= (and b!461197 res!275857) b!461192))

(assert (= (and b!461192 res!275851) b!461187))

(assert (= (and b!461187 res!275861) b!461195))

(assert (= (and b!461195 res!275852) b!461199))

(assert (= (and b!461199 res!275854) b!461184))

(assert (= (and b!461184 res!275859) b!461185))

(assert (= (and b!461185 res!275853) b!461196))

(assert (= (and b!461196 res!275862) b!461191))

(assert (= (and b!461191 res!275856) b!461189))

(assert (= (and b!461189 res!275863) b!461198))

(assert (= (and b!461186 condMapEmpty!20275) mapIsEmpty!20275))

(assert (= (and b!461186 (not condMapEmpty!20275)) mapNonEmpty!20275))

(get-info :version)

(assert (= (and mapNonEmpty!20275 ((_ is ValueCellFull!5864) mapValue!20275)) b!461188))

(assert (= (and b!461186 ((_ is ValueCellFull!5864) mapDefault!20275)) b!461193))

(assert (= start!41220 b!461186))

(declare-fun m!444623 () Bool)

(assert (=> b!461196 m!444623))

(declare-fun m!444625 () Bool)

(assert (=> b!461198 m!444625))

(declare-fun m!444627 () Bool)

(assert (=> b!461198 m!444627))

(assert (=> b!461198 m!444627))

(declare-fun m!444629 () Bool)

(assert (=> b!461198 m!444629))

(declare-fun m!444631 () Bool)

(assert (=> b!461198 m!444631))

(declare-fun m!444633 () Bool)

(assert (=> mapNonEmpty!20275 m!444633))

(declare-fun m!444635 () Bool)

(assert (=> b!461190 m!444635))

(declare-fun m!444637 () Bool)

(assert (=> start!41220 m!444637))

(declare-fun m!444639 () Bool)

(assert (=> start!41220 m!444639))

(declare-fun m!444641 () Bool)

(assert (=> b!461184 m!444641))

(declare-fun m!444643 () Bool)

(assert (=> b!461189 m!444643))

(declare-fun m!444645 () Bool)

(assert (=> b!461189 m!444645))

(declare-fun m!444647 () Bool)

(assert (=> b!461189 m!444647))

(declare-fun m!444649 () Bool)

(assert (=> b!461185 m!444649))

(declare-fun m!444651 () Bool)

(assert (=> b!461185 m!444651))

(declare-fun m!444653 () Bool)

(assert (=> b!461197 m!444653))

(declare-fun m!444655 () Bool)

(assert (=> b!461199 m!444655))

(declare-fun m!444657 () Bool)

(assert (=> b!461192 m!444657))

(declare-fun m!444659 () Bool)

(assert (=> b!461195 m!444659))

(check-sat (not b!461184) (not b!461195) (not b!461198) (not mapNonEmpty!20275) b_and!19407 (not b!461196) (not b!461197) (not b!461190) tp_is_empty!12415 (not b!461185) (not b!461189) (not start!41220) (not b_next!11077) (not b!461192))
(check-sat b_and!19407 (not b_next!11077))
