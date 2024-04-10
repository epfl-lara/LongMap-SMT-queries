; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35600 () Bool)

(assert start!35600)

(declare-fun b!357087 () Bool)

(declare-fun res!198259 () Bool)

(declare-fun e!218692 () Bool)

(assert (=> b!357087 (=> (not res!198259) (not e!218692))))

(declare-datatypes ((array!19673 0))(
  ( (array!19674 (arr!9330 (Array (_ BitVec 32) (_ BitVec 64))) (size!9682 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19673)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19673 (_ BitVec 32)) Bool)

(assert (=> b!357087 (= res!198259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357088 () Bool)

(declare-fun res!198253 () Bool)

(assert (=> b!357088 (=> (not res!198253) (not e!218692))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357088 (= res!198253 (validKeyInArray!0 k!1077))))

(declare-fun b!357089 () Bool)

(assert (=> b!357089 (= e!218692 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357089 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11715 0))(
  ( (V!11716 (val!4071 Int)) )
))
(declare-fun minValue!1150 () V!11715)

(declare-datatypes ((ValueCell!3683 0))(
  ( (ValueCellFull!3683 (v!6265 V!11715)) (EmptyCell!3683) )
))
(declare-datatypes ((array!19675 0))(
  ( (array!19676 (arr!9331 (Array (_ BitVec 32) ValueCell!3683)) (size!9683 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19675)

(declare-datatypes ((Unit!11000 0))(
  ( (Unit!11001) )
))
(declare-fun lt!165995 () Unit!11000)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11715)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 (array!19673 array!19675 (_ BitVec 32) (_ BitVec 32) V!11715 V!11715 (_ BitVec 64) (_ BitVec 32)) Unit!11000)

(assert (=> b!357089 (= lt!165995 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357090 () Bool)

(declare-fun res!198256 () Bool)

(assert (=> b!357090 (=> (not res!198256) (not e!218692))))

(declare-datatypes ((List!5384 0))(
  ( (Nil!5381) (Cons!5380 (h!6236 (_ BitVec 64)) (t!10534 List!5384)) )
))
(declare-fun arrayNoDuplicates!0 (array!19673 (_ BitVec 32) List!5384) Bool)

(assert (=> b!357090 (= res!198256 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5381))))

(declare-fun b!357091 () Bool)

(declare-fun res!198252 () Bool)

(assert (=> b!357091 (=> (not res!198252) (not e!218692))))

(assert (=> b!357091 (= res!198252 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9682 _keys!1456))))))

(declare-fun b!357092 () Bool)

(declare-fun res!198257 () Bool)

(assert (=> b!357092 (=> (not res!198257) (not e!218692))))

(assert (=> b!357092 (= res!198257 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357093 () Bool)

(declare-fun e!218695 () Bool)

(declare-fun tp_is_empty!8053 () Bool)

(assert (=> b!357093 (= e!218695 tp_is_empty!8053)))

(declare-fun mapNonEmpty!13587 () Bool)

(declare-fun mapRes!13587 () Bool)

(declare-fun tp!27564 () Bool)

(declare-fun e!218696 () Bool)

(assert (=> mapNonEmpty!13587 (= mapRes!13587 (and tp!27564 e!218696))))

(declare-fun mapKey!13587 () (_ BitVec 32))

(declare-fun mapValue!13587 () ValueCell!3683)

(declare-fun mapRest!13587 () (Array (_ BitVec 32) ValueCell!3683))

(assert (=> mapNonEmpty!13587 (= (arr!9331 _values!1208) (store mapRest!13587 mapKey!13587 mapValue!13587))))

(declare-fun mapIsEmpty!13587 () Bool)

(assert (=> mapIsEmpty!13587 mapRes!13587))

(declare-fun b!357094 () Bool)

(declare-fun res!198258 () Bool)

(assert (=> b!357094 (=> (not res!198258) (not e!218692))))

(assert (=> b!357094 (= res!198258 (and (= (size!9683 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9682 _keys!1456) (size!9683 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357095 () Bool)

(declare-fun res!198255 () Bool)

(assert (=> b!357095 (=> (not res!198255) (not e!218692))))

(assert (=> b!357095 (= res!198255 (not (= (select (arr!9330 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357096 () Bool)

(declare-fun e!218694 () Bool)

(assert (=> b!357096 (= e!218694 (and e!218695 mapRes!13587))))

(declare-fun condMapEmpty!13587 () Bool)

(declare-fun mapDefault!13587 () ValueCell!3683)

