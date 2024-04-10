; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20410 () Bool)

(assert start!20410)

(declare-fun b_free!5069 () Bool)

(declare-fun b_next!5069 () Bool)

(assert (=> start!20410 (= b_free!5069 (not b_next!5069))))

(declare-fun tp!18239 () Bool)

(declare-fun b_and!11815 () Bool)

(assert (=> start!20410 (= tp!18239 b_and!11815)))

(declare-fun b!201870 () Bool)

(declare-fun res!96583 () Bool)

(declare-fun e!132276 () Bool)

(assert (=> b!201870 (=> (not res!96583) (not e!132276))))

(declare-datatypes ((array!9079 0))(
  ( (array!9080 (arr!4290 (Array (_ BitVec 32) (_ BitVec 64))) (size!4615 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9079)

(declare-datatypes ((List!2710 0))(
  ( (Nil!2707) (Cons!2706 (h!3348 (_ BitVec 64)) (t!7641 List!2710)) )
))
(declare-fun arrayNoDuplicates!0 (array!9079 (_ BitVec 32) List!2710) Bool)

(assert (=> b!201870 (= res!96583 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2707))))

(declare-fun mapNonEmpty!8456 () Bool)

(declare-fun mapRes!8456 () Bool)

(declare-fun tp!18238 () Bool)

(declare-fun e!132275 () Bool)

(assert (=> mapNonEmpty!8456 (= mapRes!8456 (and tp!18238 e!132275))))

(declare-datatypes ((V!6213 0))(
  ( (V!6214 (val!2507 Int)) )
))
(declare-datatypes ((ValueCell!2119 0))(
  ( (ValueCellFull!2119 (v!4477 V!6213)) (EmptyCell!2119) )
))
(declare-datatypes ((array!9081 0))(
  ( (array!9082 (arr!4291 (Array (_ BitVec 32) ValueCell!2119)) (size!4616 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9081)

(declare-fun mapRest!8456 () (Array (_ BitVec 32) ValueCell!2119))

(declare-fun mapValue!8456 () ValueCell!2119)

(declare-fun mapKey!8456 () (_ BitVec 32))

(assert (=> mapNonEmpty!8456 (= (arr!4291 _values!649) (store mapRest!8456 mapKey!8456 mapValue!8456))))

(declare-fun b!201871 () Bool)

(declare-fun res!96582 () Bool)

(assert (=> b!201871 (=> (not res!96582) (not e!132276))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201871 (= res!96582 (validKeyInArray!0 k!843))))

(declare-fun b!201872 () Bool)

(declare-fun tp_is_empty!4925 () Bool)

(assert (=> b!201872 (= e!132275 tp_is_empty!4925)))

(declare-fun res!96581 () Bool)

(assert (=> start!20410 (=> (not res!96581) (not e!132276))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20410 (= res!96581 (validMask!0 mask!1149))))

(assert (=> start!20410 e!132276))

(declare-fun e!132278 () Bool)

(declare-fun array_inv!2831 (array!9081) Bool)

(assert (=> start!20410 (and (array_inv!2831 _values!649) e!132278)))

(assert (=> start!20410 true))

(assert (=> start!20410 tp_is_empty!4925))

(declare-fun array_inv!2832 (array!9079) Bool)

(assert (=> start!20410 (array_inv!2832 _keys!825)))

(assert (=> start!20410 tp!18239))

(declare-fun b!201873 () Bool)

(declare-fun e!132274 () Bool)

(assert (=> b!201873 (= e!132278 (and e!132274 mapRes!8456))))

(declare-fun condMapEmpty!8456 () Bool)

(declare-fun mapDefault!8456 () ValueCell!2119)

