; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84288 () Bool)

(assert start!84288)

(declare-fun b!986065 () Bool)

(declare-fun e!555893 () Bool)

(declare-fun e!555896 () Bool)

(declare-fun mapRes!36665 () Bool)

(assert (=> b!986065 (= e!555893 (and e!555896 mapRes!36665))))

(declare-fun condMapEmpty!36665 () Bool)

(declare-datatypes ((V!35771 0))(
  ( (V!35772 (val!11596 Int)) )
))
(declare-datatypes ((ValueCell!11064 0))(
  ( (ValueCellFull!11064 (v!14158 V!35771)) (EmptyCell!11064) )
))
(declare-datatypes ((array!62153 0))(
  ( (array!62154 (arr!29934 (Array (_ BitVec 32) ValueCell!11064)) (size!30413 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62153)

(declare-fun mapDefault!36665 () ValueCell!11064)

(assert (=> b!986065 (= condMapEmpty!36665 (= (arr!29934 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11064)) mapDefault!36665)))))

(declare-fun b!986066 () Bool)

(declare-fun res!659792 () Bool)

(declare-fun e!555895 () Bool)

(assert (=> b!986066 (=> (not res!659792) (not e!555895))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62155 0))(
  ( (array!62156 (arr!29935 (Array (_ BitVec 32) (_ BitVec 64))) (size!30414 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62155)

(assert (=> b!986066 (= res!659792 (and (= (size!30413 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30414 _keys!1544) (size!30413 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986067 () Bool)

(assert (=> b!986067 (= e!555895 false)))

(declare-fun lt!437432 () Bool)

(declare-datatypes ((List!20727 0))(
  ( (Nil!20724) (Cons!20723 (h!21885 (_ BitVec 64)) (t!29626 List!20727)) )
))
(declare-fun arrayNoDuplicates!0 (array!62155 (_ BitVec 32) List!20727) Bool)

(assert (=> b!986067 (= lt!437432 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20724))))

(declare-fun b!986068 () Bool)

(declare-fun res!659791 () Bool)

(assert (=> b!986068 (=> (not res!659791) (not e!555895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62155 (_ BitVec 32)) Bool)

(assert (=> b!986068 (= res!659791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986069 () Bool)

(declare-fun e!555897 () Bool)

(declare-fun tp_is_empty!23091 () Bool)

(assert (=> b!986069 (= e!555897 tp_is_empty!23091)))

(declare-fun b!986070 () Bool)

(assert (=> b!986070 (= e!555896 tp_is_empty!23091)))

(declare-fun mapIsEmpty!36665 () Bool)

(assert (=> mapIsEmpty!36665 mapRes!36665))

(declare-fun res!659790 () Bool)

(assert (=> start!84288 (=> (not res!659790) (not e!555895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84288 (= res!659790 (validMask!0 mask!1948))))

(assert (=> start!84288 e!555895))

(assert (=> start!84288 true))

(declare-fun array_inv!23135 (array!62153) Bool)

(assert (=> start!84288 (and (array_inv!23135 _values!1278) e!555893)))

(declare-fun array_inv!23136 (array!62155) Bool)

(assert (=> start!84288 (array_inv!23136 _keys!1544)))

(declare-fun mapNonEmpty!36665 () Bool)

(declare-fun tp!69520 () Bool)

(assert (=> mapNonEmpty!36665 (= mapRes!36665 (and tp!69520 e!555897))))

(declare-fun mapKey!36665 () (_ BitVec 32))

(declare-fun mapRest!36665 () (Array (_ BitVec 32) ValueCell!11064))

(declare-fun mapValue!36665 () ValueCell!11064)

(assert (=> mapNonEmpty!36665 (= (arr!29934 _values!1278) (store mapRest!36665 mapKey!36665 mapValue!36665))))

(assert (= (and start!84288 res!659790) b!986066))

(assert (= (and b!986066 res!659792) b!986068))

(assert (= (and b!986068 res!659791) b!986067))

(assert (= (and b!986065 condMapEmpty!36665) mapIsEmpty!36665))

(assert (= (and b!986065 (not condMapEmpty!36665)) mapNonEmpty!36665))

(get-info :version)

(assert (= (and mapNonEmpty!36665 ((_ is ValueCellFull!11064) mapValue!36665)) b!986069))

(assert (= (and b!986065 ((_ is ValueCellFull!11064) mapDefault!36665)) b!986070))

(assert (= start!84288 b!986065))

(declare-fun m!913027 () Bool)

(assert (=> b!986067 m!913027))

(declare-fun m!913029 () Bool)

(assert (=> b!986068 m!913029))

(declare-fun m!913031 () Bool)

(assert (=> start!84288 m!913031))

(declare-fun m!913033 () Bool)

(assert (=> start!84288 m!913033))

(declare-fun m!913035 () Bool)

(assert (=> start!84288 m!913035))

(declare-fun m!913037 () Bool)

(assert (=> mapNonEmpty!36665 m!913037))

(check-sat (not b!986067) (not mapNonEmpty!36665) (not start!84288) tp_is_empty!23091 (not b!986068))
(check-sat)
