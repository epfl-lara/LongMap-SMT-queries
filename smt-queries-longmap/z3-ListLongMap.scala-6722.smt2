; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84286 () Bool)

(assert start!84286)

(declare-fun b!985976 () Bool)

(declare-fun e!555868 () Bool)

(declare-fun tp_is_empty!23107 () Bool)

(assert (=> b!985976 (= e!555868 tp_is_empty!23107)))

(declare-fun b!985977 () Bool)

(declare-fun res!659760 () Bool)

(declare-fun e!555866 () Bool)

(assert (=> b!985977 (=> (not res!659760) (not e!555866))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35793 0))(
  ( (V!35794 (val!11604 Int)) )
))
(declare-datatypes ((ValueCell!11072 0))(
  ( (ValueCellFull!11072 (v!14165 V!35793)) (EmptyCell!11072) )
))
(declare-datatypes ((array!62114 0))(
  ( (array!62115 (arr!29915 (Array (_ BitVec 32) ValueCell!11072)) (size!30396 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62114)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62116 0))(
  ( (array!62117 (arr!29916 (Array (_ BitVec 32) (_ BitVec 64))) (size!30397 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62116)

(assert (=> b!985977 (= res!659760 (and (= (size!30396 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30397 _keys!1544) (size!30396 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659763 () Bool)

(assert (=> start!84286 (=> (not res!659763) (not e!555866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84286 (= res!659763 (validMask!0 mask!1948))))

(assert (=> start!84286 e!555866))

(assert (=> start!84286 true))

(declare-fun e!555865 () Bool)

(declare-fun array_inv!23131 (array!62114) Bool)

(assert (=> start!84286 (and (array_inv!23131 _values!1278) e!555865)))

(declare-fun array_inv!23132 (array!62116) Bool)

(assert (=> start!84286 (array_inv!23132 _keys!1544)))

(declare-fun b!985978 () Bool)

(declare-fun res!659762 () Bool)

(assert (=> b!985978 (=> (not res!659762) (not e!555866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62116 (_ BitVec 32)) Bool)

(assert (=> b!985978 (= res!659762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985979 () Bool)

(declare-fun res!659759 () Bool)

(assert (=> b!985979 (=> (not res!659759) (not e!555866))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985979 (= res!659759 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30397 _keys!1544))))))

(declare-fun b!985980 () Bool)

(declare-fun res!659761 () Bool)

(assert (=> b!985980 (=> (not res!659761) (not e!555866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985980 (= res!659761 (validKeyInArray!0 (select (arr!29916 _keys!1544) from!1932)))))

(declare-fun b!985981 () Bool)

(declare-fun e!555869 () Bool)

(assert (=> b!985981 (= e!555869 tp_is_empty!23107)))

(declare-fun lt!437220 () Bool)

(declare-fun b!985982 () Bool)

(assert (=> b!985982 (= e!555866 (and (or lt!437220 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437220 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437220)) (bvsgt from!1932 (size!30397 _keys!1544))))))

(assert (=> b!985982 (= lt!437220 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!985983 () Bool)

(declare-fun res!659758 () Bool)

(assert (=> b!985983 (=> (not res!659758) (not e!555866))))

(declare-datatypes ((List!20769 0))(
  ( (Nil!20766) (Cons!20765 (h!21927 (_ BitVec 64)) (t!29659 List!20769)) )
))
(declare-fun arrayNoDuplicates!0 (array!62116 (_ BitVec 32) List!20769) Bool)

(assert (=> b!985983 (= res!659758 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20766))))

(declare-fun mapIsEmpty!36689 () Bool)

(declare-fun mapRes!36689 () Bool)

(assert (=> mapIsEmpty!36689 mapRes!36689))

(declare-fun mapNonEmpty!36689 () Bool)

(declare-fun tp!69545 () Bool)

(assert (=> mapNonEmpty!36689 (= mapRes!36689 (and tp!69545 e!555868))))

(declare-fun mapValue!36689 () ValueCell!11072)

(declare-fun mapRest!36689 () (Array (_ BitVec 32) ValueCell!11072))

(declare-fun mapKey!36689 () (_ BitVec 32))

(assert (=> mapNonEmpty!36689 (= (arr!29915 _values!1278) (store mapRest!36689 mapKey!36689 mapValue!36689))))

(declare-fun b!985984 () Bool)

(assert (=> b!985984 (= e!555865 (and e!555869 mapRes!36689))))

(declare-fun condMapEmpty!36689 () Bool)

(declare-fun mapDefault!36689 () ValueCell!11072)

(assert (=> b!985984 (= condMapEmpty!36689 (= (arr!29915 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11072)) mapDefault!36689)))))

(assert (= (and start!84286 res!659763) b!985977))

(assert (= (and b!985977 res!659760) b!985978))

(assert (= (and b!985978 res!659762) b!985983))

(assert (= (and b!985983 res!659758) b!985979))

(assert (= (and b!985979 res!659759) b!985980))

(assert (= (and b!985980 res!659761) b!985982))

(assert (= (and b!985984 condMapEmpty!36689) mapIsEmpty!36689))

(assert (= (and b!985984 (not condMapEmpty!36689)) mapNonEmpty!36689))

(get-info :version)

(assert (= (and mapNonEmpty!36689 ((_ is ValueCellFull!11072) mapValue!36689)) b!985976))

(assert (= (and b!985984 ((_ is ValueCellFull!11072) mapDefault!36689)) b!985981))

(assert (= start!84286 b!985984))

(declare-fun m!912365 () Bool)

(assert (=> b!985983 m!912365))

(declare-fun m!912367 () Bool)

(assert (=> start!84286 m!912367))

(declare-fun m!912369 () Bool)

(assert (=> start!84286 m!912369))

(declare-fun m!912371 () Bool)

(assert (=> start!84286 m!912371))

(declare-fun m!912373 () Bool)

(assert (=> b!985978 m!912373))

(declare-fun m!912375 () Bool)

(assert (=> b!985980 m!912375))

(assert (=> b!985980 m!912375))

(declare-fun m!912377 () Bool)

(assert (=> b!985980 m!912377))

(declare-fun m!912379 () Bool)

(assert (=> mapNonEmpty!36689 m!912379))

(check-sat (not mapNonEmpty!36689) (not b!985980) (not start!84286) tp_is_empty!23107 (not b!985978) (not b!985983))
(check-sat)
