; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3758 () Bool)

(assert start!3758)

(declare-fun res!15584 () Bool)

(declare-fun e!17035 () Bool)

(assert (=> start!3758 (=> (not res!15584) (not e!17035))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3758 (= res!15584 (validMask!0 mask!2294))))

(assert (=> start!3758 e!17035))

(assert (=> start!3758 true))

(declare-datatypes ((V!1263 0))(
  ( (V!1264 (val!566 Int)) )
))
(declare-datatypes ((ValueCell!340 0))(
  ( (ValueCellFull!340 (v!1652 V!1263)) (EmptyCell!340) )
))
(declare-datatypes ((array!1405 0))(
  ( (array!1406 (arr!660 (Array (_ BitVec 32) ValueCell!340)) (size!761 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1405)

(declare-fun e!17036 () Bool)

(declare-fun array_inv!449 (array!1405) Bool)

(assert (=> start!3758 (and (array_inv!449 _values!1501) e!17036)))

(declare-datatypes ((array!1407 0))(
  ( (array!1408 (arr!661 (Array (_ BitVec 32) (_ BitVec 64))) (size!762 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1407)

(declare-fun array_inv!450 (array!1407) Bool)

(assert (=> start!3758 (array_inv!450 _keys!1833)))

(declare-fun mapIsEmpty!1135 () Bool)

(declare-fun mapRes!1135 () Bool)

(assert (=> mapIsEmpty!1135 mapRes!1135))

(declare-fun b!26216 () Bool)

(assert (=> b!26216 (= e!17035 false)))

(declare-fun lt!10328 () Bool)

(declare-datatypes ((List!582 0))(
  ( (Nil!579) (Cons!578 (h!1145 (_ BitVec 64)) (t!3269 List!582)) )
))
(declare-fun arrayNoDuplicates!0 (array!1407 (_ BitVec 32) List!582) Bool)

(assert (=> b!26216 (= lt!10328 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!579))))

(declare-fun b!26217 () Bool)

(declare-fun res!15585 () Bool)

(assert (=> b!26217 (=> (not res!15585) (not e!17035))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26217 (= res!15585 (and (= (size!761 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!762 _keys!1833) (size!761 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26218 () Bool)

(declare-fun res!15583 () Bool)

(assert (=> b!26218 (=> (not res!15583) (not e!17035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1407 (_ BitVec 32)) Bool)

(assert (=> b!26218 (= res!15583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1135 () Bool)

(declare-fun tp!3655 () Bool)

(declare-fun e!17038 () Bool)

(assert (=> mapNonEmpty!1135 (= mapRes!1135 (and tp!3655 e!17038))))

(declare-fun mapKey!1135 () (_ BitVec 32))

(declare-fun mapValue!1135 () ValueCell!340)

(declare-fun mapRest!1135 () (Array (_ BitVec 32) ValueCell!340))

(assert (=> mapNonEmpty!1135 (= (arr!660 _values!1501) (store mapRest!1135 mapKey!1135 mapValue!1135))))

(declare-fun b!26219 () Bool)

(declare-fun tp_is_empty!1079 () Bool)

(assert (=> b!26219 (= e!17038 tp_is_empty!1079)))

(declare-fun b!26220 () Bool)

(declare-fun e!17037 () Bool)

(assert (=> b!26220 (= e!17036 (and e!17037 mapRes!1135))))

(declare-fun condMapEmpty!1135 () Bool)

(declare-fun mapDefault!1135 () ValueCell!340)

