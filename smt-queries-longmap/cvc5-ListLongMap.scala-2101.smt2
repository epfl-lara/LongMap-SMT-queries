; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35774 () Bool)

(assert start!35774)

(declare-fun mapIsEmpty!13848 () Bool)

(declare-fun mapRes!13848 () Bool)

(assert (=> mapIsEmpty!13848 mapRes!13848))

(declare-fun b!359354 () Bool)

(declare-fun res!199737 () Bool)

(declare-fun e!220080 () Bool)

(assert (=> b!359354 (=> (not res!199737) (not e!220080))))

(declare-datatypes ((array!20013 0))(
  ( (array!20014 (arr!9500 (Array (_ BitVec 32) (_ BitVec 64))) (size!9852 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20013)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20013 (_ BitVec 32)) Bool)

(assert (=> b!359354 (= res!199737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13848 () Bool)

(declare-fun tp!27915 () Bool)

(declare-fun e!220078 () Bool)

(assert (=> mapNonEmpty!13848 (= mapRes!13848 (and tp!27915 e!220078))))

(declare-datatypes ((V!11947 0))(
  ( (V!11948 (val!4158 Int)) )
))
(declare-datatypes ((ValueCell!3770 0))(
  ( (ValueCellFull!3770 (v!6352 V!11947)) (EmptyCell!3770) )
))
(declare-fun mapRest!13848 () (Array (_ BitVec 32) ValueCell!3770))

(declare-fun mapKey!13848 () (_ BitVec 32))

(declare-fun mapValue!13848 () ValueCell!3770)

(declare-datatypes ((array!20015 0))(
  ( (array!20016 (arr!9501 (Array (_ BitVec 32) ValueCell!3770)) (size!9853 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20015)

(assert (=> mapNonEmpty!13848 (= (arr!9501 _values!1208) (store mapRest!13848 mapKey!13848 mapValue!13848))))

(declare-fun b!359355 () Bool)

(assert (=> b!359355 (= e!220080 false)))

(declare-fun lt!166328 () Bool)

(declare-datatypes ((List!5465 0))(
  ( (Nil!5462) (Cons!5461 (h!6317 (_ BitVec 64)) (t!10615 List!5465)) )
))
(declare-fun arrayNoDuplicates!0 (array!20013 (_ BitVec 32) List!5465) Bool)

(assert (=> b!359355 (= lt!166328 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5462))))

(declare-fun b!359356 () Bool)

(declare-fun e!220079 () Bool)

(declare-fun e!220082 () Bool)

(assert (=> b!359356 (= e!220079 (and e!220082 mapRes!13848))))

(declare-fun condMapEmpty!13848 () Bool)

(declare-fun mapDefault!13848 () ValueCell!3770)

