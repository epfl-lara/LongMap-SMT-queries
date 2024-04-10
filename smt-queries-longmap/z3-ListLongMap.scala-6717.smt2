; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84276 () Bool)

(assert start!84276)

(declare-fun res!659738 () Bool)

(declare-fun e!555807 () Bool)

(assert (=> start!84276 (=> (not res!659738) (not e!555807))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84276 (= res!659738 (validMask!0 mask!1948))))

(assert (=> start!84276 e!555807))

(assert (=> start!84276 true))

(declare-datatypes ((V!35755 0))(
  ( (V!35756 (val!11590 Int)) )
))
(declare-datatypes ((ValueCell!11058 0))(
  ( (ValueCellFull!11058 (v!14152 V!35755)) (EmptyCell!11058) )
))
(declare-datatypes ((array!62131 0))(
  ( (array!62132 (arr!29923 (Array (_ BitVec 32) ValueCell!11058)) (size!30402 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62131)

(declare-fun e!555805 () Bool)

(declare-fun array_inv!23125 (array!62131) Bool)

(assert (=> start!84276 (and (array_inv!23125 _values!1278) e!555805)))

(declare-datatypes ((array!62133 0))(
  ( (array!62134 (arr!29924 (Array (_ BitVec 32) (_ BitVec 64))) (size!30403 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62133)

(declare-fun array_inv!23126 (array!62133) Bool)

(assert (=> start!84276 (array_inv!23126 _keys!1544)))

(declare-fun b!985957 () Bool)

(declare-fun e!555806 () Bool)

(declare-fun tp_is_empty!23079 () Bool)

(assert (=> b!985957 (= e!555806 tp_is_empty!23079)))

(declare-fun mapNonEmpty!36647 () Bool)

(declare-fun mapRes!36647 () Bool)

(declare-fun tp!69502 () Bool)

(declare-fun e!555803 () Bool)

(assert (=> mapNonEmpty!36647 (= mapRes!36647 (and tp!69502 e!555803))))

(declare-fun mapRest!36647 () (Array (_ BitVec 32) ValueCell!11058))

(declare-fun mapKey!36647 () (_ BitVec 32))

(declare-fun mapValue!36647 () ValueCell!11058)

(assert (=> mapNonEmpty!36647 (= (arr!29923 _values!1278) (store mapRest!36647 mapKey!36647 mapValue!36647))))

(declare-fun b!985958 () Bool)

(declare-fun res!659737 () Bool)

(assert (=> b!985958 (=> (not res!659737) (not e!555807))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985958 (= res!659737 (and (= (size!30402 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30403 _keys!1544) (size!30402 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985959 () Bool)

(assert (=> b!985959 (= e!555805 (and e!555806 mapRes!36647))))

(declare-fun condMapEmpty!36647 () Bool)

(declare-fun mapDefault!36647 () ValueCell!11058)

(assert (=> b!985959 (= condMapEmpty!36647 (= (arr!29923 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11058)) mapDefault!36647)))))

(declare-fun mapIsEmpty!36647 () Bool)

(assert (=> mapIsEmpty!36647 mapRes!36647))

(declare-fun b!985960 () Bool)

(declare-fun res!659736 () Bool)

(assert (=> b!985960 (=> (not res!659736) (not e!555807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62133 (_ BitVec 32)) Bool)

(assert (=> b!985960 (= res!659736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985961 () Bool)

(assert (=> b!985961 (= e!555803 tp_is_empty!23079)))

(declare-fun b!985962 () Bool)

(assert (=> b!985962 (= e!555807 false)))

(declare-fun lt!437414 () Bool)

(declare-datatypes ((List!20723 0))(
  ( (Nil!20720) (Cons!20719 (h!21881 (_ BitVec 64)) (t!29622 List!20723)) )
))
(declare-fun arrayNoDuplicates!0 (array!62133 (_ BitVec 32) List!20723) Bool)

(assert (=> b!985962 (= lt!437414 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20720))))

(assert (= (and start!84276 res!659738) b!985958))

(assert (= (and b!985958 res!659737) b!985960))

(assert (= (and b!985960 res!659736) b!985962))

(assert (= (and b!985959 condMapEmpty!36647) mapIsEmpty!36647))

(assert (= (and b!985959 (not condMapEmpty!36647)) mapNonEmpty!36647))

(get-info :version)

(assert (= (and mapNonEmpty!36647 ((_ is ValueCellFull!11058) mapValue!36647)) b!985961))

(assert (= (and b!985959 ((_ is ValueCellFull!11058) mapDefault!36647)) b!985957))

(assert (= start!84276 b!985959))

(declare-fun m!912955 () Bool)

(assert (=> start!84276 m!912955))

(declare-fun m!912957 () Bool)

(assert (=> start!84276 m!912957))

(declare-fun m!912959 () Bool)

(assert (=> start!84276 m!912959))

(declare-fun m!912961 () Bool)

(assert (=> mapNonEmpty!36647 m!912961))

(declare-fun m!912963 () Bool)

(assert (=> b!985960 m!912963))

(declare-fun m!912965 () Bool)

(assert (=> b!985962 m!912965))

(check-sat tp_is_empty!23079 (not mapNonEmpty!36647) (not b!985960) (not b!985962) (not start!84276))
(check-sat)
