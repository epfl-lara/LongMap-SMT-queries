; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84264 () Bool)

(assert start!84264)

(declare-fun res!659682 () Bool)

(declare-fun e!555713 () Bool)

(assert (=> start!84264 (=> (not res!659682) (not e!555713))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84264 (= res!659682 (validMask!0 mask!1948))))

(assert (=> start!84264 e!555713))

(assert (=> start!84264 true))

(declare-datatypes ((V!35739 0))(
  ( (V!35740 (val!11584 Int)) )
))
(declare-datatypes ((ValueCell!11052 0))(
  ( (ValueCellFull!11052 (v!14146 V!35739)) (EmptyCell!11052) )
))
(declare-datatypes ((array!62109 0))(
  ( (array!62110 (arr!29912 (Array (_ BitVec 32) ValueCell!11052)) (size!30391 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62109)

(declare-fun e!555716 () Bool)

(declare-fun array_inv!23119 (array!62109) Bool)

(assert (=> start!84264 (and (array_inv!23119 _values!1278) e!555716)))

(declare-datatypes ((array!62111 0))(
  ( (array!62112 (arr!29913 (Array (_ BitVec 32) (_ BitVec 64))) (size!30392 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62111)

(declare-fun array_inv!23120 (array!62111) Bool)

(assert (=> start!84264 (array_inv!23120 _keys!1544)))

(declare-fun mapNonEmpty!36629 () Bool)

(declare-fun mapRes!36629 () Bool)

(declare-fun tp!69484 () Bool)

(declare-fun e!555714 () Bool)

(assert (=> mapNonEmpty!36629 (= mapRes!36629 (and tp!69484 e!555714))))

(declare-fun mapKey!36629 () (_ BitVec 32))

(declare-fun mapValue!36629 () ValueCell!11052)

(declare-fun mapRest!36629 () (Array (_ BitVec 32) ValueCell!11052))

(assert (=> mapNonEmpty!36629 (= (arr!29912 _values!1278) (store mapRest!36629 mapKey!36629 mapValue!36629))))

(declare-fun mapIsEmpty!36629 () Bool)

(assert (=> mapIsEmpty!36629 mapRes!36629))

(declare-fun b!985849 () Bool)

(assert (=> b!985849 (= e!555713 false)))

(declare-fun lt!437396 () Bool)

(declare-datatypes ((List!20718 0))(
  ( (Nil!20715) (Cons!20714 (h!21876 (_ BitVec 64)) (t!29617 List!20718)) )
))
(declare-fun arrayNoDuplicates!0 (array!62111 (_ BitVec 32) List!20718) Bool)

(assert (=> b!985849 (= lt!437396 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20715))))

(declare-fun b!985850 () Bool)

(declare-fun e!555715 () Bool)

(declare-fun tp_is_empty!23067 () Bool)

(assert (=> b!985850 (= e!555715 tp_is_empty!23067)))

(declare-fun b!985851 () Bool)

(assert (=> b!985851 (= e!555714 tp_is_empty!23067)))

(declare-fun b!985852 () Bool)

(declare-fun res!659683 () Bool)

(assert (=> b!985852 (=> (not res!659683) (not e!555713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62111 (_ BitVec 32)) Bool)

(assert (=> b!985852 (= res!659683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985853 () Bool)

(assert (=> b!985853 (= e!555716 (and e!555715 mapRes!36629))))

(declare-fun condMapEmpty!36629 () Bool)

(declare-fun mapDefault!36629 () ValueCell!11052)

(assert (=> b!985853 (= condMapEmpty!36629 (= (arr!29912 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11052)) mapDefault!36629)))))

(declare-fun b!985854 () Bool)

(declare-fun res!659684 () Bool)

(assert (=> b!985854 (=> (not res!659684) (not e!555713))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985854 (= res!659684 (and (= (size!30391 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30392 _keys!1544) (size!30391 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84264 res!659682) b!985854))

(assert (= (and b!985854 res!659684) b!985852))

(assert (= (and b!985852 res!659683) b!985849))

(assert (= (and b!985853 condMapEmpty!36629) mapIsEmpty!36629))

(assert (= (and b!985853 (not condMapEmpty!36629)) mapNonEmpty!36629))

(get-info :version)

(assert (= (and mapNonEmpty!36629 ((_ is ValueCellFull!11052) mapValue!36629)) b!985851))

(assert (= (and b!985853 ((_ is ValueCellFull!11052) mapDefault!36629)) b!985850))

(assert (= start!84264 b!985853))

(declare-fun m!912883 () Bool)

(assert (=> start!84264 m!912883))

(declare-fun m!912885 () Bool)

(assert (=> start!84264 m!912885))

(declare-fun m!912887 () Bool)

(assert (=> start!84264 m!912887))

(declare-fun m!912889 () Bool)

(assert (=> mapNonEmpty!36629 m!912889))

(declare-fun m!912891 () Bool)

(assert (=> b!985849 m!912891))

(declare-fun m!912893 () Bool)

(assert (=> b!985852 m!912893))

(check-sat (not b!985849) (not b!985852) (not start!84264) tp_is_empty!23067 (not mapNonEmpty!36629))
(check-sat)
