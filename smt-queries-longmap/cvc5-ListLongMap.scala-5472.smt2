; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72616 () Bool)

(assert start!72616)

(declare-fun b!842933 () Bool)

(declare-fun res!572873 () Bool)

(declare-fun e!470239 () Bool)

(assert (=> b!842933 (=> (not res!572873) (not e!470239))))

(declare-datatypes ((array!47598 0))(
  ( (array!47599 (arr!22830 (Array (_ BitVec 32) (_ BitVec 64))) (size!23270 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47598)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47598 (_ BitVec 32)) Bool)

(assert (=> b!842933 (= res!572873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25100 () Bool)

(declare-fun mapRes!25100 () Bool)

(declare-fun tp!48418 () Bool)

(declare-fun e!470238 () Bool)

(assert (=> mapNonEmpty!25100 (= mapRes!25100 (and tp!48418 e!470238))))

(declare-datatypes ((V!25937 0))(
  ( (V!25938 (val!7881 Int)) )
))
(declare-datatypes ((ValueCell!7394 0))(
  ( (ValueCellFull!7394 (v!10306 V!25937)) (EmptyCell!7394) )
))
(declare-fun mapRest!25100 () (Array (_ BitVec 32) ValueCell!7394))

(declare-fun mapKey!25100 () (_ BitVec 32))

(declare-datatypes ((array!47600 0))(
  ( (array!47601 (arr!22831 (Array (_ BitVec 32) ValueCell!7394)) (size!23271 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47600)

(declare-fun mapValue!25100 () ValueCell!7394)

(assert (=> mapNonEmpty!25100 (= (arr!22831 _values!688) (store mapRest!25100 mapKey!25100 mapValue!25100))))

(declare-fun mapIsEmpty!25100 () Bool)

(assert (=> mapIsEmpty!25100 mapRes!25100))

(declare-fun res!572872 () Bool)

(assert (=> start!72616 (=> (not res!572872) (not e!470239))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72616 (= res!572872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23270 _keys!868))))))

(assert (=> start!72616 e!470239))

(assert (=> start!72616 true))

(declare-fun array_inv!18164 (array!47598) Bool)

(assert (=> start!72616 (array_inv!18164 _keys!868)))

(declare-fun e!470242 () Bool)

(declare-fun array_inv!18165 (array!47600) Bool)

(assert (=> start!72616 (and (array_inv!18165 _values!688) e!470242)))

(declare-fun b!842934 () Bool)

(declare-fun tp_is_empty!15667 () Bool)

(assert (=> b!842934 (= e!470238 tp_is_empty!15667)))

(declare-fun b!842935 () Bool)

(declare-fun res!572871 () Bool)

(assert (=> b!842935 (=> (not res!572871) (not e!470239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842935 (= res!572871 (validMask!0 mask!1196))))

(declare-fun b!842936 () Bool)

(declare-fun e!470241 () Bool)

(assert (=> b!842936 (= e!470241 tp_is_empty!15667)))

(declare-fun b!842937 () Bool)

(assert (=> b!842937 (= e!470242 (and e!470241 mapRes!25100))))

(declare-fun condMapEmpty!25100 () Bool)

(declare-fun mapDefault!25100 () ValueCell!7394)

