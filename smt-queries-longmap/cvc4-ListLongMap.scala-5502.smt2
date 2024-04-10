; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72800 () Bool)

(assert start!72800)

(declare-fun b!844865 () Bool)

(declare-fun e!471621 () Bool)

(declare-fun tp_is_empty!15851 () Bool)

(assert (=> b!844865 (= e!471621 tp_is_empty!15851)))

(declare-fun mapIsEmpty!25376 () Bool)

(declare-fun mapRes!25376 () Bool)

(assert (=> mapIsEmpty!25376 mapRes!25376))

(declare-fun mapNonEmpty!25376 () Bool)

(declare-fun tp!48694 () Bool)

(assert (=> mapNonEmpty!25376 (= mapRes!25376 (and tp!48694 e!471621))))

(declare-fun mapKey!25376 () (_ BitVec 32))

(declare-datatypes ((V!26181 0))(
  ( (V!26182 (val!7973 Int)) )
))
(declare-datatypes ((ValueCell!7486 0))(
  ( (ValueCellFull!7486 (v!10398 V!26181)) (EmptyCell!7486) )
))
(declare-fun mapValue!25376 () ValueCell!7486)

(declare-fun mapRest!25376 () (Array (_ BitVec 32) ValueCell!7486))

(declare-datatypes ((array!47928 0))(
  ( (array!47929 (arr!22995 (Array (_ BitVec 32) ValueCell!7486)) (size!23435 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47928)

(assert (=> mapNonEmpty!25376 (= (arr!22995 _values!688) (store mapRest!25376 mapKey!25376 mapValue!25376))))

(declare-fun b!844867 () Bool)

(declare-fun res!573976 () Bool)

(declare-fun e!471620 () Bool)

(assert (=> b!844867 (=> (not res!573976) (not e!471620))))

(declare-datatypes ((array!47930 0))(
  ( (array!47931 (arr!22996 (Array (_ BitVec 32) (_ BitVec 64))) (size!23436 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47930)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47930 (_ BitVec 32)) Bool)

(assert (=> b!844867 (= res!573976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844868 () Bool)

(declare-fun e!471622 () Bool)

(declare-fun e!471619 () Bool)

(assert (=> b!844868 (= e!471622 (and e!471619 mapRes!25376))))

(declare-fun condMapEmpty!25376 () Bool)

(declare-fun mapDefault!25376 () ValueCell!7486)

