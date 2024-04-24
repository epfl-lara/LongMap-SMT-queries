; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33442 () Bool)

(assert start!33442)

(declare-fun b!332038 () Bool)

(declare-fun res!182955 () Bool)

(declare-fun e!203818 () Bool)

(assert (=> b!332038 (=> (not res!182955) (not e!203818))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9923 0))(
  ( (V!9924 (val!3399 Int)) )
))
(declare-datatypes ((ValueCell!3011 0))(
  ( (ValueCellFull!3011 (v!5559 V!9923)) (EmptyCell!3011) )
))
(declare-datatypes ((array!17014 0))(
  ( (array!17015 (arr!8041 (Array (_ BitVec 32) ValueCell!3011)) (size!8393 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17014)

(declare-datatypes ((array!17016 0))(
  ( (array!17017 (arr!8042 (Array (_ BitVec 32) (_ BitVec 64))) (size!8394 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17016)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332038 (= res!182955 (and (= (size!8393 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8394 _keys!1895) (size!8393 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332039 () Bool)

(declare-fun e!203820 () Bool)

(declare-fun e!203822 () Bool)

(declare-fun mapRes!11448 () Bool)

(assert (=> b!332039 (= e!203820 (and e!203822 mapRes!11448))))

(declare-fun condMapEmpty!11448 () Bool)

(declare-fun mapDefault!11448 () ValueCell!3011)

(assert (=> b!332039 (= condMapEmpty!11448 (= (arr!8041 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3011)) mapDefault!11448)))))

(declare-fun mapNonEmpty!11448 () Bool)

(declare-fun tp!23823 () Bool)

(declare-fun e!203821 () Bool)

(assert (=> mapNonEmpty!11448 (= mapRes!11448 (and tp!23823 e!203821))))

(declare-fun mapRest!11448 () (Array (_ BitVec 32) ValueCell!3011))

(declare-fun mapValue!11448 () ValueCell!3011)

(declare-fun mapKey!11448 () (_ BitVec 32))

(assert (=> mapNonEmpty!11448 (= (arr!8041 _values!1525) (store mapRest!11448 mapKey!11448 mapValue!11448))))

(declare-fun b!332041 () Bool)

(declare-fun res!182957 () Bool)

(assert (=> b!332041 (=> (not res!182957) (not e!203818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17016 (_ BitVec 32)) Bool)

(assert (=> b!332041 (= res!182957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11448 () Bool)

(assert (=> mapIsEmpty!11448 mapRes!11448))

(declare-fun b!332040 () Bool)

(declare-fun tp_is_empty!6709 () Bool)

(assert (=> b!332040 (= e!203822 tp_is_empty!6709)))

(declare-fun res!182956 () Bool)

(assert (=> start!33442 (=> (not res!182956) (not e!203818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33442 (= res!182956 (validMask!0 mask!2385))))

(assert (=> start!33442 e!203818))

(assert (=> start!33442 true))

(declare-fun array_inv!5980 (array!17014) Bool)

(assert (=> start!33442 (and (array_inv!5980 _values!1525) e!203820)))

(declare-fun array_inv!5981 (array!17016) Bool)

(assert (=> start!33442 (array_inv!5981 _keys!1895)))

(declare-fun b!332042 () Bool)

(assert (=> b!332042 (= e!203821 tp_is_empty!6709)))

(declare-fun b!332043 () Bool)

(assert (=> b!332043 (= e!203818 false)))

(declare-fun lt!158977 () Bool)

(declare-datatypes ((List!4495 0))(
  ( (Nil!4492) (Cons!4491 (h!5347 (_ BitVec 64)) (t!9569 List!4495)) )
))
(declare-fun arrayNoDuplicates!0 (array!17016 (_ BitVec 32) List!4495) Bool)

(assert (=> b!332043 (= lt!158977 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4492))))

(assert (= (and start!33442 res!182956) b!332038))

(assert (= (and b!332038 res!182955) b!332041))

(assert (= (and b!332041 res!182957) b!332043))

(assert (= (and b!332039 condMapEmpty!11448) mapIsEmpty!11448))

(assert (= (and b!332039 (not condMapEmpty!11448)) mapNonEmpty!11448))

(get-info :version)

(assert (= (and mapNonEmpty!11448 ((_ is ValueCellFull!3011) mapValue!11448)) b!332042))

(assert (= (and b!332039 ((_ is ValueCellFull!3011) mapDefault!11448)) b!332040))

(assert (= start!33442 b!332039))

(declare-fun m!336953 () Bool)

(assert (=> mapNonEmpty!11448 m!336953))

(declare-fun m!336955 () Bool)

(assert (=> b!332041 m!336955))

(declare-fun m!336957 () Bool)

(assert (=> start!33442 m!336957))

(declare-fun m!336959 () Bool)

(assert (=> start!33442 m!336959))

(declare-fun m!336961 () Bool)

(assert (=> start!33442 m!336961))

(declare-fun m!336963 () Bool)

(assert (=> b!332043 m!336963))

(check-sat (not b!332043) tp_is_empty!6709 (not b!332041) (not start!33442) (not mapNonEmpty!11448))
(check-sat)
