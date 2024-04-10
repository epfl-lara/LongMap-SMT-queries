; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95968 () Bool)

(assert start!95968)

(declare-fun b_free!22621 () Bool)

(declare-fun b_next!22621 () Bool)

(assert (=> start!95968 (= b_free!22621 (not b_next!22621))))

(declare-fun tp!79711 () Bool)

(declare-fun b_and!35917 () Bool)

(assert (=> start!95968 (= tp!79711 b_and!35917)))

(declare-fun b!1087402 () Bool)

(declare-fun res!725173 () Bool)

(declare-fun e!621144 () Bool)

(assert (=> b!1087402 (=> (not res!725173) (not e!621144))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70173 0))(
  ( (array!70174 (arr!33760 (Array (_ BitVec 32) (_ BitVec 64))) (size!34296 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70173)

(assert (=> b!1087402 (= res!725173 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34296 _keys!1070))))))

(declare-fun b!1087403 () Bool)

(declare-fun res!725179 () Bool)

(declare-fun e!621143 () Bool)

(assert (=> b!1087403 (=> (not res!725179) (not e!621143))))

(declare-fun lt!483888 () array!70173)

(declare-datatypes ((List!23551 0))(
  ( (Nil!23548) (Cons!23547 (h!24756 (_ BitVec 64)) (t!33230 List!23551)) )
))
(declare-fun arrayNoDuplicates!0 (array!70173 (_ BitVec 32) List!23551) Bool)

(assert (=> b!1087403 (= res!725179 (arrayNoDuplicates!0 lt!483888 #b00000000000000000000000000000000 Nil!23548))))

(declare-fun b!1087404 () Bool)

(declare-fun res!725174 () Bool)

(assert (=> b!1087404 (=> (not res!725174) (not e!621144))))

(assert (=> b!1087404 (= res!725174 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23548))))

(declare-fun mapNonEmpty!41689 () Bool)

(declare-fun mapRes!41689 () Bool)

(declare-fun tp!79712 () Bool)

(declare-fun e!621145 () Bool)

(assert (=> mapNonEmpty!41689 (= mapRes!41689 (and tp!79712 e!621145))))

(declare-datatypes ((V!40625 0))(
  ( (V!40626 (val!13368 Int)) )
))
(declare-datatypes ((ValueCell!12602 0))(
  ( (ValueCellFull!12602 (v!15989 V!40625)) (EmptyCell!12602) )
))
(declare-datatypes ((array!70175 0))(
  ( (array!70176 (arr!33761 (Array (_ BitVec 32) ValueCell!12602)) (size!34297 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70175)

(declare-fun mapValue!41689 () ValueCell!12602)

(declare-fun mapRest!41689 () (Array (_ BitVec 32) ValueCell!12602))

(declare-fun mapKey!41689 () (_ BitVec 32))

(assert (=> mapNonEmpty!41689 (= (arr!33761 _values!874) (store mapRest!41689 mapKey!41689 mapValue!41689))))

(declare-fun b!1087405 () Bool)

(declare-fun e!621139 () Bool)

(declare-fun e!621142 () Bool)

(assert (=> b!1087405 (= e!621139 e!621142)))

(declare-fun res!725181 () Bool)

(assert (=> b!1087405 (=> res!725181 e!621142)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1087405 (= res!725181 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16964 0))(
  ( (tuple2!16965 (_1!8493 (_ BitVec 64)) (_2!8493 V!40625)) )
))
(declare-datatypes ((List!23552 0))(
  ( (Nil!23549) (Cons!23548 (h!24757 tuple2!16964) (t!33231 List!23552)) )
))
(declare-datatypes ((ListLongMap!14933 0))(
  ( (ListLongMap!14934 (toList!7482 List!23552)) )
))
(declare-fun lt!483880 () ListLongMap!14933)

(declare-fun lt!483885 () ListLongMap!14933)

(assert (=> b!1087405 (= lt!483880 lt!483885)))

(declare-fun lt!483883 () ListLongMap!14933)

(declare-fun lt!483882 () tuple2!16964)

(declare-fun +!3287 (ListLongMap!14933 tuple2!16964) ListLongMap!14933)

(assert (=> b!1087405 (= lt!483885 (+!3287 lt!483883 lt!483882))))

(declare-fun lt!483889 () ListLongMap!14933)

(declare-fun lt!483878 () ListLongMap!14933)

(assert (=> b!1087405 (= lt!483889 lt!483878)))

(declare-fun lt!483886 () ListLongMap!14933)

(assert (=> b!1087405 (= lt!483878 (+!3287 lt!483886 lt!483882))))

(declare-fun lt!483877 () ListLongMap!14933)

(assert (=> b!1087405 (= lt!483880 (+!3287 lt!483877 lt!483882))))

(declare-fun zeroValue!831 () V!40625)

(assert (=> b!1087405 (= lt!483882 (tuple2!16965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087407 () Bool)

(declare-fun e!621141 () Bool)

(declare-fun e!621140 () Bool)

(assert (=> b!1087407 (= e!621141 (and e!621140 mapRes!41689))))

(declare-fun condMapEmpty!41689 () Bool)

(declare-fun mapDefault!41689 () ValueCell!12602)

