; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20346 () Bool)

(assert start!20346)

(declare-fun b_free!5005 () Bool)

(declare-fun b_next!5005 () Bool)

(assert (=> start!20346 (= b_free!5005 (not b_next!5005))))

(declare-fun tp!18047 () Bool)

(declare-fun b_and!11751 () Bool)

(assert (=> start!20346 (= tp!18047 b_and!11751)))

(declare-fun b!200718 () Bool)

(declare-fun res!95719 () Bool)

(declare-fun e!131606 () Bool)

(assert (=> b!200718 (=> (not res!95719) (not e!131606))))

(declare-datatypes ((array!8953 0))(
  ( (array!8954 (arr!4227 (Array (_ BitVec 32) (_ BitVec 64))) (size!4552 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8953)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8953 (_ BitVec 32)) Bool)

(assert (=> b!200718 (= res!95719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200719 () Bool)

(declare-fun e!131600 () Bool)

(declare-fun e!131604 () Bool)

(assert (=> b!200719 (= e!131600 e!131604)))

(declare-fun res!95714 () Bool)

(assert (=> b!200719 (=> res!95714 e!131604)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!200719 (= res!95714 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6129 0))(
  ( (V!6130 (val!2475 Int)) )
))
(declare-datatypes ((tuple2!3742 0))(
  ( (tuple2!3743 (_1!1882 (_ BitVec 64)) (_2!1882 V!6129)) )
))
(declare-datatypes ((List!2659 0))(
  ( (Nil!2656) (Cons!2655 (h!3297 tuple2!3742) (t!7590 List!2659)) )
))
(declare-datatypes ((ListLongMap!2655 0))(
  ( (ListLongMap!2656 (toList!1343 List!2659)) )
))
(declare-fun lt!99422 () ListLongMap!2655)

(declare-fun lt!99409 () ListLongMap!2655)

(assert (=> b!200719 (= lt!99422 lt!99409)))

(declare-fun lt!99413 () ListLongMap!2655)

(declare-fun lt!99416 () tuple2!3742)

(declare-fun +!370 (ListLongMap!2655 tuple2!3742) ListLongMap!2655)

(assert (=> b!200719 (= lt!99409 (+!370 lt!99413 lt!99416))))

(declare-datatypes ((Unit!6040 0))(
  ( (Unit!6041) )
))
(declare-fun lt!99415 () Unit!6040)

(declare-fun v!520 () V!6129)

(declare-fun zeroValue!615 () V!6129)

(declare-fun lt!99419 () ListLongMap!2655)

(declare-fun addCommutativeForDiffKeys!91 (ListLongMap!2655 (_ BitVec 64) V!6129 (_ BitVec 64) V!6129) Unit!6040)

(assert (=> b!200719 (= lt!99415 (addCommutativeForDiffKeys!91 lt!99419 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99421 () ListLongMap!2655)

(declare-fun lt!99414 () tuple2!3742)

(assert (=> b!200719 (= lt!99421 (+!370 lt!99422 lt!99414))))

(declare-fun lt!99417 () ListLongMap!2655)

(declare-fun lt!99418 () tuple2!3742)

(assert (=> b!200719 (= lt!99422 (+!370 lt!99417 lt!99418))))

(declare-fun lt!99408 () ListLongMap!2655)

(declare-fun lt!99420 () ListLongMap!2655)

(assert (=> b!200719 (= lt!99408 lt!99420)))

(assert (=> b!200719 (= lt!99420 (+!370 lt!99413 lt!99414))))

(assert (=> b!200719 (= lt!99413 (+!370 lt!99419 lt!99418))))

(declare-fun lt!99411 () ListLongMap!2655)

(assert (=> b!200719 (= lt!99421 (+!370 (+!370 lt!99411 lt!99418) lt!99414))))

(declare-fun minValue!615 () V!6129)

(assert (=> b!200719 (= lt!99414 (tuple2!3743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200719 (= lt!99418 (tuple2!3743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200720 () Bool)

(declare-fun e!131601 () Bool)

(declare-fun e!131602 () Bool)

(declare-fun mapRes!8360 () Bool)

(assert (=> b!200720 (= e!131601 (and e!131602 mapRes!8360))))

(declare-fun condMapEmpty!8360 () Bool)

(declare-datatypes ((ValueCell!2087 0))(
  ( (ValueCellFull!2087 (v!4445 V!6129)) (EmptyCell!2087) )
))
(declare-datatypes ((array!8955 0))(
  ( (array!8956 (arr!4228 (Array (_ BitVec 32) ValueCell!2087)) (size!4553 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8955)

(declare-fun mapDefault!8360 () ValueCell!2087)

