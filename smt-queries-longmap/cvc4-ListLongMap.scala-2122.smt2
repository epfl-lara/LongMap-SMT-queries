; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35926 () Bool)

(assert start!35926)

(declare-fun mapNonEmpty!14049 () Bool)

(declare-fun mapRes!14049 () Bool)

(declare-fun tp!28125 () Bool)

(declare-fun e!221103 () Bool)

(assert (=> mapNonEmpty!14049 (= mapRes!14049 (and tp!28125 e!221103))))

(declare-fun mapKey!14049 () (_ BitVec 32))

(declare-datatypes ((V!12119 0))(
  ( (V!12120 (val!4223 Int)) )
))
(declare-datatypes ((ValueCell!3835 0))(
  ( (ValueCellFull!3835 (v!6417 V!12119)) (EmptyCell!3835) )
))
(declare-datatypes ((array!20263 0))(
  ( (array!20264 (arr!9623 (Array (_ BitVec 32) ValueCell!3835)) (size!9975 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20263)

(declare-fun mapValue!14049 () ValueCell!3835)

(declare-fun mapRest!14049 () (Array (_ BitVec 32) ValueCell!3835))

(assert (=> mapNonEmpty!14049 (= (arr!9623 _values!1277) (store mapRest!14049 mapKey!14049 mapValue!14049))))

(declare-fun mapIsEmpty!14049 () Bool)

(assert (=> mapIsEmpty!14049 mapRes!14049))

(declare-fun b!361134 () Bool)

(declare-fun res!200903 () Bool)

(declare-fun e!221107 () Bool)

(assert (=> b!361134 (=> (not res!200903) (not e!221107))))

(declare-datatypes ((array!20265 0))(
  ( (array!20266 (arr!9624 (Array (_ BitVec 32) (_ BitVec 64))) (size!9976 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20265)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!361134 (= res!200903 (and (= (size!9975 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9976 _keys!1541) (size!9975 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361135 () Bool)

(assert (=> b!361135 (= e!221107 (bvsgt #b00000000000000000000000000000000 (size!9976 _keys!1541)))))

(declare-fun b!361136 () Bool)

(declare-fun e!221105 () Bool)

(declare-fun tp_is_empty!8357 () Bool)

(assert (=> b!361136 (= e!221105 tp_is_empty!8357)))

(declare-fun b!361137 () Bool)

(declare-fun e!221104 () Bool)

(assert (=> b!361137 (= e!221104 (and e!221105 mapRes!14049))))

(declare-fun condMapEmpty!14049 () Bool)

(declare-fun mapDefault!14049 () ValueCell!3835)

