; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3724 () Bool)

(assert start!3724)

(declare-fun mapNonEmpty!1111 () Bool)

(declare-fun mapRes!1111 () Bool)

(declare-fun tp!3631 () Bool)

(declare-fun e!16886 () Bool)

(assert (=> mapNonEmpty!1111 (= mapRes!1111 (and tp!3631 e!16886))))

(declare-datatypes ((V!1247 0))(
  ( (V!1248 (val!560 Int)) )
))
(declare-datatypes ((ValueCell!334 0))(
  ( (ValueCellFull!334 (v!1645 V!1247)) (EmptyCell!334) )
))
(declare-fun mapRest!1111 () (Array (_ BitVec 32) ValueCell!334))

(declare-fun mapValue!1111 () ValueCell!334)

(declare-fun mapKey!1111 () (_ BitVec 32))

(declare-datatypes ((array!1377 0))(
  ( (array!1378 (arr!648 (Array (_ BitVec 32) ValueCell!334)) (size!749 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1377)

(assert (=> mapNonEmpty!1111 (= (arr!648 _values!1501) (store mapRest!1111 mapKey!1111 mapValue!1111))))

(declare-fun b!26020 () Bool)

(declare-fun res!15470 () Bool)

(declare-fun e!16889 () Bool)

(assert (=> b!26020 (=> (not res!15470) (not e!16889))))

(declare-datatypes ((array!1379 0))(
  ( (array!1380 (arr!649 (Array (_ BitVec 32) (_ BitVec 64))) (size!750 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1379)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1379 (_ BitVec 32)) Bool)

(assert (=> b!26020 (= res!15470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15471 () Bool)

(assert (=> start!3724 (=> (not res!15471) (not e!16889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3724 (= res!15471 (validMask!0 mask!2294))))

(assert (=> start!3724 e!16889))

(assert (=> start!3724 true))

(declare-fun e!16887 () Bool)

(declare-fun array_inv!437 (array!1377) Bool)

(assert (=> start!3724 (and (array_inv!437 _values!1501) e!16887)))

(declare-fun array_inv!438 (array!1379) Bool)

(assert (=> start!3724 (array_inv!438 _keys!1833)))

(declare-fun mapIsEmpty!1111 () Bool)

(assert (=> mapIsEmpty!1111 mapRes!1111))

(declare-fun b!26021 () Bool)

(declare-datatypes ((List!577 0))(
  ( (Nil!574) (Cons!573 (h!1140 (_ BitVec 64)) (t!3264 List!577)) )
))
(declare-fun noDuplicate!12 (List!577) Bool)

(assert (=> b!26021 (= e!16889 (not (noDuplicate!12 Nil!574)))))

(declare-fun b!26022 () Bool)

(declare-fun tp_is_empty!1067 () Bool)

(assert (=> b!26022 (= e!16886 tp_is_empty!1067)))

(declare-fun b!26023 () Bool)

(declare-fun res!15469 () Bool)

(assert (=> b!26023 (=> (not res!15469) (not e!16889))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26023 (= res!15469 (and (= (size!749 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!750 _keys!1833) (size!749 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26024 () Bool)

(declare-fun res!15472 () Bool)

(assert (=> b!26024 (=> (not res!15472) (not e!16889))))

(assert (=> b!26024 (= res!15472 (and (bvsle #b00000000000000000000000000000000 (size!750 _keys!1833)) (bvslt (size!750 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26025 () Bool)

(declare-fun e!16888 () Bool)

(assert (=> b!26025 (= e!16888 tp_is_empty!1067)))

(declare-fun b!26026 () Bool)

(assert (=> b!26026 (= e!16887 (and e!16888 mapRes!1111))))

(declare-fun condMapEmpty!1111 () Bool)

(declare-fun mapDefault!1111 () ValueCell!334)

