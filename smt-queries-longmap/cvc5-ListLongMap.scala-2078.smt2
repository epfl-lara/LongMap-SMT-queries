; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35636 () Bool)

(assert start!35636)

(declare-fun b_free!7891 () Bool)

(declare-fun b_next!7891 () Bool)

(assert (=> start!35636 (= b_free!7891 (not b_next!7891))))

(declare-fun tp!27657 () Bool)

(declare-fun b_and!15133 () Bool)

(assert (=> start!35636 (= tp!27657 b_and!15133)))

(declare-fun mapNonEmpty!13641 () Bool)

(declare-fun mapRes!13641 () Bool)

(declare-fun tp!27656 () Bool)

(declare-fun e!219001 () Bool)

(assert (=> mapNonEmpty!13641 (= mapRes!13641 (and tp!27656 e!219001))))

(declare-datatypes ((V!11763 0))(
  ( (V!11764 (val!4089 Int)) )
))
(declare-datatypes ((ValueCell!3701 0))(
  ( (ValueCellFull!3701 (v!6283 V!11763)) (EmptyCell!3701) )
))
(declare-fun mapValue!13641 () ValueCell!3701)

(declare-fun mapKey!13641 () (_ BitVec 32))

(declare-fun mapRest!13641 () (Array (_ BitVec 32) ValueCell!3701))

(declare-datatypes ((array!19745 0))(
  ( (array!19746 (arr!9366 (Array (_ BitVec 32) ValueCell!3701)) (size!9718 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19745)

(assert (=> mapNonEmpty!13641 (= (arr!9366 _values!1208) (store mapRest!13641 mapKey!13641 mapValue!13641))))

(declare-fun b!357720 () Bool)

(declare-fun res!198722 () Bool)

(declare-fun e!219003 () Bool)

(assert (=> b!357720 (=> (not res!198722) (not e!219003))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19747 0))(
  ( (array!19748 (arr!9367 (Array (_ BitVec 32) (_ BitVec 64))) (size!9719 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19747)

(assert (=> b!357720 (= res!198722 (and (= (size!9718 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9719 _keys!1456) (size!9718 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357721 () Bool)

(declare-fun tp_is_empty!8089 () Bool)

(assert (=> b!357721 (= e!219001 tp_is_empty!8089)))

(declare-fun b!357722 () Bool)

(declare-fun e!219005 () Bool)

(assert (=> b!357722 (= e!219003 (not e!219005))))

(declare-fun res!198724 () Bool)

(assert (=> b!357722 (=> res!198724 e!219005)))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357722 (= res!198724 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9719 _keys!1456))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357722 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11763)

(declare-datatypes ((Unit!11026 0))(
  ( (Unit!11027) )
))
(declare-fun lt!166088 () Unit!11026)

(declare-fun zeroValue!1150 () V!11763)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 (array!19747 array!19745 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 64) (_ BitVec 32)) Unit!11026)

(assert (=> b!357722 (= lt!166088 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357723 () Bool)

(declare-fun e!219004 () Bool)

(declare-fun e!219000 () Bool)

(assert (=> b!357723 (= e!219004 (and e!219000 mapRes!13641))))

(declare-fun condMapEmpty!13641 () Bool)

(declare-fun mapDefault!13641 () ValueCell!3701)

