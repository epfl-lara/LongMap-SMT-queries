; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36942 () Bool)

(assert start!36942)

(declare-fun b_free!8069 () Bool)

(declare-fun b_next!8069 () Bool)

(assert (=> start!36942 (= b_free!8069 (not b_next!8069))))

(declare-fun tp!28922 () Bool)

(declare-fun b_and!15311 () Bool)

(assert (=> start!36942 (= tp!28922 b_and!15311)))

(declare-fun b!370385 () Bool)

(declare-fun res!207981 () Bool)

(declare-fun e!226234 () Bool)

(assert (=> b!370385 (=> (not res!207981) (not e!226234))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12727 0))(
  ( (V!12728 (val!4403 Int)) )
))
(declare-datatypes ((ValueCell!4015 0))(
  ( (ValueCellFull!4015 (v!6600 V!12727)) (EmptyCell!4015) )
))
(declare-datatypes ((array!21377 0))(
  ( (array!21378 (arr!10157 (Array (_ BitVec 32) ValueCell!4015)) (size!10509 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21377)

(declare-datatypes ((array!21379 0))(
  ( (array!21380 (arr!10158 (Array (_ BitVec 32) (_ BitVec 64))) (size!10510 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21379)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370385 (= res!207981 (and (= (size!10509 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10510 _keys!658) (size!10509 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370386 () Bool)

(declare-fun res!207989 () Bool)

(assert (=> b!370386 (=> (not res!207989) (not e!226234))))

(declare-datatypes ((List!5678 0))(
  ( (Nil!5675) (Cons!5674 (h!6530 (_ BitVec 64)) (t!10828 List!5678)) )
))
(declare-fun arrayNoDuplicates!0 (array!21379 (_ BitVec 32) List!5678) Bool)

(assert (=> b!370386 (= res!207989 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5675))))

(declare-fun b!370387 () Bool)

(declare-fun res!207983 () Bool)

(assert (=> b!370387 (=> (not res!207983) (not e!226234))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370387 (= res!207983 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10510 _keys!658))))))

(declare-fun b!370388 () Bool)

(declare-fun e!226233 () Bool)

(declare-fun tp_is_empty!8717 () Bool)

(assert (=> b!370388 (= e!226233 tp_is_empty!8717)))

(declare-fun res!207988 () Bool)

(assert (=> start!36942 (=> (not res!207988) (not e!226234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36942 (= res!207988 (validMask!0 mask!970))))

(assert (=> start!36942 e!226234))

(declare-fun e!226232 () Bool)

(declare-fun array_inv!7504 (array!21377) Bool)

(assert (=> start!36942 (and (array_inv!7504 _values!506) e!226232)))

(assert (=> start!36942 tp!28922))

(assert (=> start!36942 true))

(assert (=> start!36942 tp_is_empty!8717))

(declare-fun array_inv!7505 (array!21379) Bool)

(assert (=> start!36942 (array_inv!7505 _keys!658)))

(declare-fun mapIsEmpty!14640 () Bool)

(declare-fun mapRes!14640 () Bool)

(assert (=> mapIsEmpty!14640 mapRes!14640))

(declare-fun mapNonEmpty!14640 () Bool)

(declare-fun tp!28923 () Bool)

(assert (=> mapNonEmpty!14640 (= mapRes!14640 (and tp!28923 e!226233))))

(declare-fun mapValue!14640 () ValueCell!4015)

(declare-fun mapKey!14640 () (_ BitVec 32))

(declare-fun mapRest!14640 () (Array (_ BitVec 32) ValueCell!4015))

(assert (=> mapNonEmpty!14640 (= (arr!10157 _values!506) (store mapRest!14640 mapKey!14640 mapValue!14640))))

(declare-fun b!370389 () Bool)

(declare-fun e!226235 () Bool)

(assert (=> b!370389 (= e!226234 e!226235)))

(declare-fun res!207986 () Bool)

(assert (=> b!370389 (=> (not res!207986) (not e!226235))))

(declare-fun lt!169955 () array!21379)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21379 (_ BitVec 32)) Bool)

(assert (=> b!370389 (= res!207986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169955 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!370389 (= lt!169955 (array!21380 (store (arr!10158 _keys!658) i!548 k!778) (size!10510 _keys!658)))))

(declare-fun b!370390 () Bool)

(declare-fun e!226230 () Bool)

(assert (=> b!370390 (= e!226230 tp_is_empty!8717)))

(declare-fun b!370391 () Bool)

(declare-fun res!207982 () Bool)

(assert (=> b!370391 (=> (not res!207982) (not e!226234))))

(assert (=> b!370391 (= res!207982 (or (= (select (arr!10158 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10158 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370392 () Bool)

(declare-fun res!207980 () Bool)

(assert (=> b!370392 (=> (not res!207980) (not e!226234))))

(assert (=> b!370392 (= res!207980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370393 () Bool)

(assert (=> b!370393 (= e!226235 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5840 0))(
  ( (tuple2!5841 (_1!2931 (_ BitVec 64)) (_2!2931 V!12727)) )
))
(declare-datatypes ((List!5679 0))(
  ( (Nil!5676) (Cons!5675 (h!6531 tuple2!5840) (t!10829 List!5679)) )
))
(declare-datatypes ((ListLongMap!4753 0))(
  ( (ListLongMap!4754 (toList!2392 List!5679)) )
))
(declare-fun lt!169956 () ListLongMap!4753)

(declare-fun zeroValue!472 () V!12727)

(declare-fun v!373 () V!12727)

(declare-fun minValue!472 () V!12727)

(declare-fun getCurrentListMapNoExtraKeys!669 (array!21379 array!21377 (_ BitVec 32) (_ BitVec 32) V!12727 V!12727 (_ BitVec 32) Int) ListLongMap!4753)

(assert (=> b!370393 (= lt!169956 (getCurrentListMapNoExtraKeys!669 lt!169955 (array!21378 (store (arr!10157 _values!506) i!548 (ValueCellFull!4015 v!373)) (size!10509 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169954 () ListLongMap!4753)

(assert (=> b!370393 (= lt!169954 (getCurrentListMapNoExtraKeys!669 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370394 () Bool)

(assert (=> b!370394 (= e!226232 (and e!226230 mapRes!14640))))

(declare-fun condMapEmpty!14640 () Bool)

(declare-fun mapDefault!14640 () ValueCell!4015)

