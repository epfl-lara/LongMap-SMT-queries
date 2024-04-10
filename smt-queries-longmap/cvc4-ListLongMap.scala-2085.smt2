; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35682 () Bool)

(assert start!35682)

(declare-fun b!358427 () Bool)

(declare-fun res!199223 () Bool)

(declare-fun e!219389 () Bool)

(assert (=> b!358427 (=> (not res!199223) (not e!219389))))

(declare-datatypes ((array!19835 0))(
  ( (array!19836 (arr!9411 (Array (_ BitVec 32) (_ BitVec 64))) (size!9763 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19835)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19835 (_ BitVec 32)) Bool)

(assert (=> b!358427 (= res!199223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13710 () Bool)

(declare-fun mapRes!13710 () Bool)

(declare-fun tp!27768 () Bool)

(declare-fun e!219392 () Bool)

(assert (=> mapNonEmpty!13710 (= mapRes!13710 (and tp!27768 e!219392))))

(declare-datatypes ((V!11823 0))(
  ( (V!11824 (val!4112 Int)) )
))
(declare-datatypes ((ValueCell!3724 0))(
  ( (ValueCellFull!3724 (v!6306 V!11823)) (EmptyCell!3724) )
))
(declare-fun mapRest!13710 () (Array (_ BitVec 32) ValueCell!3724))

(declare-fun mapValue!13710 () ValueCell!3724)

(declare-fun mapKey!13710 () (_ BitVec 32))

(declare-datatypes ((array!19837 0))(
  ( (array!19838 (arr!9412 (Array (_ BitVec 32) ValueCell!3724)) (size!9764 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19837)

(assert (=> mapNonEmpty!13710 (= (arr!9412 _values!1208) (store mapRest!13710 mapKey!13710 mapValue!13710))))

(declare-fun b!358428 () Bool)

(declare-fun tp_is_empty!8135 () Bool)

(assert (=> b!358428 (= e!219392 tp_is_empty!8135)))

(declare-fun b!358429 () Bool)

(declare-fun e!219391 () Bool)

(assert (=> b!358429 (= e!219391 tp_is_empty!8135)))

(declare-fun mapIsEmpty!13710 () Bool)

(assert (=> mapIsEmpty!13710 mapRes!13710))

(declare-fun b!358430 () Bool)

(assert (=> b!358430 (= e!219389 false)))

(declare-fun lt!166190 () Bool)

(declare-datatypes ((List!5430 0))(
  ( (Nil!5427) (Cons!5426 (h!6282 (_ BitVec 64)) (t!10580 List!5430)) )
))
(declare-fun arrayNoDuplicates!0 (array!19835 (_ BitVec 32) List!5430) Bool)

(assert (=> b!358430 (= lt!166190 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5427))))

(declare-fun b!358431 () Bool)

(declare-fun e!219390 () Bool)

(assert (=> b!358431 (= e!219390 (and e!219391 mapRes!13710))))

(declare-fun condMapEmpty!13710 () Bool)

(declare-fun mapDefault!13710 () ValueCell!3724)

