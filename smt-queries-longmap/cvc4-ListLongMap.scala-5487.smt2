; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72710 () Bool)

(assert start!72710)

(declare-fun b!843920 () Bool)

(declare-fun e!470946 () Bool)

(declare-fun tp_is_empty!15761 () Bool)

(assert (=> b!843920 (= e!470946 tp_is_empty!15761)))

(declare-fun mapIsEmpty!25241 () Bool)

(declare-fun mapRes!25241 () Bool)

(assert (=> mapIsEmpty!25241 mapRes!25241))

(declare-fun b!843921 () Bool)

(declare-fun e!470947 () Bool)

(assert (=> b!843921 (= e!470947 false)))

(declare-fun lt!381208 () Bool)

(declare-datatypes ((array!47766 0))(
  ( (array!47767 (arr!22914 (Array (_ BitVec 32) (_ BitVec 64))) (size!23354 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47766)

(declare-datatypes ((List!16255 0))(
  ( (Nil!16252) (Cons!16251 (h!17382 (_ BitVec 64)) (t!22626 List!16255)) )
))
(declare-fun arrayNoDuplicates!0 (array!47766 (_ BitVec 32) List!16255) Bool)

(assert (=> b!843921 (= lt!381208 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16252))))

(declare-fun b!843922 () Bool)

(declare-fun e!470945 () Bool)

(assert (=> b!843922 (= e!470945 tp_is_empty!15761)))

(declare-fun b!843923 () Bool)

(declare-fun res!573436 () Bool)

(assert (=> b!843923 (=> (not res!573436) (not e!470947))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47766 (_ BitVec 32)) Bool)

(assert (=> b!843923 (= res!573436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25241 () Bool)

(declare-fun tp!48559 () Bool)

(assert (=> mapNonEmpty!25241 (= mapRes!25241 (and tp!48559 e!470945))))

(declare-datatypes ((V!26061 0))(
  ( (V!26062 (val!7928 Int)) )
))
(declare-datatypes ((ValueCell!7441 0))(
  ( (ValueCellFull!7441 (v!10353 V!26061)) (EmptyCell!7441) )
))
(declare-fun mapRest!25241 () (Array (_ BitVec 32) ValueCell!7441))

(declare-fun mapKey!25241 () (_ BitVec 32))

(declare-fun mapValue!25241 () ValueCell!7441)

(declare-datatypes ((array!47768 0))(
  ( (array!47769 (arr!22915 (Array (_ BitVec 32) ValueCell!7441)) (size!23355 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47768)

(assert (=> mapNonEmpty!25241 (= (arr!22915 _values!688) (store mapRest!25241 mapKey!25241 mapValue!25241))))

(declare-fun b!843924 () Bool)

(declare-fun res!573437 () Bool)

(assert (=> b!843924 (=> (not res!573437) (not e!470947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843924 (= res!573437 (validMask!0 mask!1196))))

(declare-fun res!573435 () Bool)

(assert (=> start!72710 (=> (not res!573435) (not e!470947))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72710 (= res!573435 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23354 _keys!868))))))

(assert (=> start!72710 e!470947))

(assert (=> start!72710 true))

(declare-fun array_inv!18222 (array!47766) Bool)

(assert (=> start!72710 (array_inv!18222 _keys!868)))

(declare-fun e!470944 () Bool)

(declare-fun array_inv!18223 (array!47768) Bool)

(assert (=> start!72710 (and (array_inv!18223 _values!688) e!470944)))

(declare-fun b!843925 () Bool)

(assert (=> b!843925 (= e!470944 (and e!470946 mapRes!25241))))

(declare-fun condMapEmpty!25241 () Bool)

(declare-fun mapDefault!25241 () ValueCell!7441)

