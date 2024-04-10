; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35756 () Bool)

(assert start!35756)

(declare-fun b!359192 () Bool)

(declare-fun res!199655 () Bool)

(declare-fun e!219947 () Bool)

(assert (=> b!359192 (=> (not res!199655) (not e!219947))))

(declare-datatypes ((array!19977 0))(
  ( (array!19978 (arr!9482 (Array (_ BitVec 32) (_ BitVec 64))) (size!9834 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19977)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19977 (_ BitVec 32)) Bool)

(assert (=> b!359192 (= res!199655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359193 () Bool)

(declare-fun res!199657 () Bool)

(assert (=> b!359193 (=> (not res!199657) (not e!219947))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11923 0))(
  ( (V!11924 (val!4149 Int)) )
))
(declare-datatypes ((ValueCell!3761 0))(
  ( (ValueCellFull!3761 (v!6343 V!11923)) (EmptyCell!3761) )
))
(declare-datatypes ((array!19979 0))(
  ( (array!19980 (arr!9483 (Array (_ BitVec 32) ValueCell!3761)) (size!9835 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19979)

(assert (=> b!359193 (= res!199657 (and (= (size!9835 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9834 _keys!1456) (size!9835 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359194 () Bool)

(declare-fun e!219943 () Bool)

(declare-fun tp_is_empty!8209 () Bool)

(assert (=> b!359194 (= e!219943 tp_is_empty!8209)))

(declare-fun mapNonEmpty!13821 () Bool)

(declare-fun mapRes!13821 () Bool)

(declare-fun tp!27888 () Bool)

(assert (=> mapNonEmpty!13821 (= mapRes!13821 (and tp!27888 e!219943))))

(declare-fun mapRest!13821 () (Array (_ BitVec 32) ValueCell!3761))

(declare-fun mapValue!13821 () ValueCell!3761)

(declare-fun mapKey!13821 () (_ BitVec 32))

(assert (=> mapNonEmpty!13821 (= (arr!9483 _values!1208) (store mapRest!13821 mapKey!13821 mapValue!13821))))

(declare-fun b!359196 () Bool)

(declare-fun e!219944 () Bool)

(declare-fun e!219946 () Bool)

(assert (=> b!359196 (= e!219944 (and e!219946 mapRes!13821))))

(declare-fun condMapEmpty!13821 () Bool)

(declare-fun mapDefault!13821 () ValueCell!3761)

