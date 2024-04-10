; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84270 () Bool)

(assert start!84270)

(declare-fun b!985903 () Bool)

(declare-fun e!555761 () Bool)

(assert (=> b!985903 (= e!555761 false)))

(declare-fun lt!437405 () Bool)

(declare-datatypes ((array!62119 0))(
  ( (array!62120 (arr!29917 (Array (_ BitVec 32) (_ BitVec 64))) (size!30396 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62119)

(declare-datatypes ((List!20720 0))(
  ( (Nil!20717) (Cons!20716 (h!21878 (_ BitVec 64)) (t!29619 List!20720)) )
))
(declare-fun arrayNoDuplicates!0 (array!62119 (_ BitVec 32) List!20720) Bool)

(assert (=> b!985903 (= lt!437405 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20717))))

(declare-fun b!985905 () Bool)

(declare-fun e!555758 () Bool)

(declare-fun tp_is_empty!23073 () Bool)

(assert (=> b!985905 (= e!555758 tp_is_empty!23073)))

(declare-fun b!985906 () Bool)

(declare-fun res!659710 () Bool)

(assert (=> b!985906 (=> (not res!659710) (not e!555761))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35747 0))(
  ( (V!35748 (val!11587 Int)) )
))
(declare-datatypes ((ValueCell!11055 0))(
  ( (ValueCellFull!11055 (v!14149 V!35747)) (EmptyCell!11055) )
))
(declare-datatypes ((array!62121 0))(
  ( (array!62122 (arr!29918 (Array (_ BitVec 32) ValueCell!11055)) (size!30397 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62121)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985906 (= res!659710 (and (= (size!30397 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30396 _keys!1544) (size!30397 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36638 () Bool)

(declare-fun mapRes!36638 () Bool)

(declare-fun tp!69493 () Bool)

(declare-fun e!555762 () Bool)

(assert (=> mapNonEmpty!36638 (= mapRes!36638 (and tp!69493 e!555762))))

(declare-fun mapRest!36638 () (Array (_ BitVec 32) ValueCell!11055))

(declare-fun mapValue!36638 () ValueCell!11055)

(declare-fun mapKey!36638 () (_ BitVec 32))

(assert (=> mapNonEmpty!36638 (= (arr!29918 _values!1278) (store mapRest!36638 mapKey!36638 mapValue!36638))))

(declare-fun b!985907 () Bool)

(assert (=> b!985907 (= e!555762 tp_is_empty!23073)))

(declare-fun res!659711 () Bool)

(assert (=> start!84270 (=> (not res!659711) (not e!555761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84270 (= res!659711 (validMask!0 mask!1948))))

(assert (=> start!84270 e!555761))

(assert (=> start!84270 true))

(declare-fun e!555759 () Bool)

(declare-fun array_inv!23121 (array!62121) Bool)

(assert (=> start!84270 (and (array_inv!23121 _values!1278) e!555759)))

(declare-fun array_inv!23122 (array!62119) Bool)

(assert (=> start!84270 (array_inv!23122 _keys!1544)))

(declare-fun b!985904 () Bool)

(declare-fun res!659709 () Bool)

(assert (=> b!985904 (=> (not res!659709) (not e!555761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62119 (_ BitVec 32)) Bool)

(assert (=> b!985904 (= res!659709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36638 () Bool)

(assert (=> mapIsEmpty!36638 mapRes!36638))

(declare-fun b!985908 () Bool)

(assert (=> b!985908 (= e!555759 (and e!555758 mapRes!36638))))

(declare-fun condMapEmpty!36638 () Bool)

(declare-fun mapDefault!36638 () ValueCell!11055)

(assert (=> b!985908 (= condMapEmpty!36638 (= (arr!29918 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11055)) mapDefault!36638)))))

(assert (= (and start!84270 res!659711) b!985906))

(assert (= (and b!985906 res!659710) b!985904))

(assert (= (and b!985904 res!659709) b!985903))

(assert (= (and b!985908 condMapEmpty!36638) mapIsEmpty!36638))

(assert (= (and b!985908 (not condMapEmpty!36638)) mapNonEmpty!36638))

(get-info :version)

(assert (= (and mapNonEmpty!36638 ((_ is ValueCellFull!11055) mapValue!36638)) b!985907))

(assert (= (and b!985908 ((_ is ValueCellFull!11055) mapDefault!36638)) b!985905))

(assert (= start!84270 b!985908))

(declare-fun m!912919 () Bool)

(assert (=> b!985903 m!912919))

(declare-fun m!912921 () Bool)

(assert (=> mapNonEmpty!36638 m!912921))

(declare-fun m!912923 () Bool)

(assert (=> start!84270 m!912923))

(declare-fun m!912925 () Bool)

(assert (=> start!84270 m!912925))

(declare-fun m!912927 () Bool)

(assert (=> start!84270 m!912927))

(declare-fun m!912929 () Bool)

(assert (=> b!985904 m!912929))

(check-sat (not b!985903) (not start!84270) (not mapNonEmpty!36638) tp_is_empty!23073 (not b!985904))
(check-sat)
