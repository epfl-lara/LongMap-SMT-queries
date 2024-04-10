; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20422 () Bool)

(assert start!20422)

(declare-fun b_free!5081 () Bool)

(declare-fun b_next!5081 () Bool)

(assert (=> start!20422 (= b_free!5081 (not b_next!5081))))

(declare-fun tp!18275 () Bool)

(declare-fun b_and!11827 () Bool)

(assert (=> start!20422 (= tp!18275 b_and!11827)))

(declare-fun b!202086 () Bool)

(declare-fun res!96743 () Bool)

(declare-fun e!132399 () Bool)

(assert (=> b!202086 (=> (not res!96743) (not e!132399))))

(declare-datatypes ((array!9101 0))(
  ( (array!9102 (arr!4301 (Array (_ BitVec 32) (_ BitVec 64))) (size!4626 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9101)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202086 (= res!96743 (= (select (arr!4301 _keys!825) i!601) k!843))))

(declare-fun res!96737 () Bool)

(assert (=> start!20422 (=> (not res!96737) (not e!132399))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20422 (= res!96737 (validMask!0 mask!1149))))

(assert (=> start!20422 e!132399))

(declare-datatypes ((V!6229 0))(
  ( (V!6230 (val!2513 Int)) )
))
(declare-datatypes ((ValueCell!2125 0))(
  ( (ValueCellFull!2125 (v!4483 V!6229)) (EmptyCell!2125) )
))
(declare-datatypes ((array!9103 0))(
  ( (array!9104 (arr!4302 (Array (_ BitVec 32) ValueCell!2125)) (size!4627 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9103)

(declare-fun e!132403 () Bool)

(declare-fun array_inv!2839 (array!9103) Bool)

(assert (=> start!20422 (and (array_inv!2839 _values!649) e!132403)))

(assert (=> start!20422 true))

(declare-fun tp_is_empty!4937 () Bool)

(assert (=> start!20422 tp_is_empty!4937))

(declare-fun array_inv!2840 (array!9101) Bool)

(assert (=> start!20422 (array_inv!2840 _keys!825)))

(assert (=> start!20422 tp!18275))

(declare-fun mapNonEmpty!8474 () Bool)

(declare-fun mapRes!8474 () Bool)

(declare-fun tp!18274 () Bool)

(declare-fun e!132404 () Bool)

(assert (=> mapNonEmpty!8474 (= mapRes!8474 (and tp!18274 e!132404))))

(declare-fun mapKey!8474 () (_ BitVec 32))

(declare-fun mapRest!8474 () (Array (_ BitVec 32) ValueCell!2125))

(declare-fun mapValue!8474 () ValueCell!2125)

(assert (=> mapNonEmpty!8474 (= (arr!4302 _values!649) (store mapRest!8474 mapKey!8474 mapValue!8474))))

(declare-fun b!202087 () Bool)

(declare-fun res!96740 () Bool)

(assert (=> b!202087 (=> (not res!96740) (not e!132399))))

(assert (=> b!202087 (= res!96740 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4626 _keys!825))))))

(declare-fun b!202088 () Bool)

(declare-fun e!132400 () Bool)

(assert (=> b!202088 (= e!132403 (and e!132400 mapRes!8474))))

(declare-fun condMapEmpty!8474 () Bool)

(declare-fun mapDefault!8474 () ValueCell!2125)

