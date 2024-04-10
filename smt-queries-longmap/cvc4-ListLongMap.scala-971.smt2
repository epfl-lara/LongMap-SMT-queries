; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21048 () Bool)

(assert start!21048)

(declare-fun b_free!5579 () Bool)

(declare-fun b_next!5579 () Bool)

(assert (=> start!21048 (= b_free!5579 (not b_next!5579))))

(declare-fun tp!19796 () Bool)

(declare-fun b_and!12397 () Bool)

(assert (=> start!21048 (= tp!19796 b_and!12397)))

(declare-fun b!211640 () Bool)

(declare-fun e!137757 () Bool)

(declare-fun tp_is_empty!5441 () Bool)

(assert (=> b!211640 (= e!137757 tp_is_empty!5441)))

(declare-fun b!211641 () Bool)

(declare-fun res!103380 () Bool)

(declare-fun e!137754 () Bool)

(assert (=> b!211641 (=> (not res!103380) (not e!137754))))

(declare-datatypes ((array!10083 0))(
  ( (array!10084 (arr!4786 (Array (_ BitVec 32) (_ BitVec 64))) (size!5111 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10083)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6901 0))(
  ( (V!6902 (val!2765 Int)) )
))
(declare-datatypes ((ValueCell!2377 0))(
  ( (ValueCellFull!2377 (v!4759 V!6901)) (EmptyCell!2377) )
))
(declare-datatypes ((array!10085 0))(
  ( (array!10086 (arr!4787 (Array (_ BitVec 32) ValueCell!2377)) (size!5112 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10085)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!211641 (= res!103380 (and (= (size!5112 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5111 _keys!825) (size!5112 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211642 () Bool)

(declare-fun res!103382 () Bool)

(assert (=> b!211642 (=> (not res!103382) (not e!137754))))

(declare-datatypes ((List!3072 0))(
  ( (Nil!3069) (Cons!3068 (h!3710 (_ BitVec 64)) (t!8015 List!3072)) )
))
(declare-fun arrayNoDuplicates!0 (array!10083 (_ BitVec 32) List!3072) Bool)

(assert (=> b!211642 (= res!103382 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3069))))

(declare-fun b!211643 () Bool)

(declare-fun res!103376 () Bool)

(assert (=> b!211643 (=> (not res!103376) (not e!137754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10083 (_ BitVec 32)) Bool)

(assert (=> b!211643 (= res!103376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211644 () Bool)

(declare-fun res!103375 () Bool)

(assert (=> b!211644 (=> (not res!103375) (not e!137754))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211644 (= res!103375 (validKeyInArray!0 k!843))))

(declare-fun res!103378 () Bool)

(assert (=> start!21048 (=> (not res!103378) (not e!137754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21048 (= res!103378 (validMask!0 mask!1149))))

(assert (=> start!21048 e!137754))

(declare-fun e!137755 () Bool)

(declare-fun array_inv!3167 (array!10085) Bool)

(assert (=> start!21048 (and (array_inv!3167 _values!649) e!137755)))

(assert (=> start!21048 true))

(assert (=> start!21048 tp_is_empty!5441))

(declare-fun array_inv!3168 (array!10083) Bool)

(assert (=> start!21048 (array_inv!3168 _keys!825)))

(assert (=> start!21048 tp!19796))

(declare-fun mapIsEmpty!9248 () Bool)

(declare-fun mapRes!9248 () Bool)

(assert (=> mapIsEmpty!9248 mapRes!9248))

(declare-fun b!211645 () Bool)

(declare-fun e!137756 () Bool)

(assert (=> b!211645 (= e!137754 (not e!137756))))

(declare-fun res!103381 () Bool)

(assert (=> b!211645 (=> res!103381 e!137756)))

(assert (=> b!211645 (= res!103381 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4182 0))(
  ( (tuple2!4183 (_1!2102 (_ BitVec 64)) (_2!2102 V!6901)) )
))
(declare-datatypes ((List!3073 0))(
  ( (Nil!3070) (Cons!3069 (h!3711 tuple2!4182) (t!8016 List!3073)) )
))
(declare-datatypes ((ListLongMap!3095 0))(
  ( (ListLongMap!3096 (toList!1563 List!3073)) )
))
(declare-fun lt!108873 () ListLongMap!3095)

(declare-fun zeroValue!615 () V!6901)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6901)

(declare-fun getCurrentListMap!1096 (array!10083 array!10085 (_ BitVec 32) (_ BitVec 32) V!6901 V!6901 (_ BitVec 32) Int) ListLongMap!3095)

(assert (=> b!211645 (= lt!108873 (getCurrentListMap!1096 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108872 () array!10085)

(declare-fun lt!108871 () ListLongMap!3095)

(assert (=> b!211645 (= lt!108871 (getCurrentListMap!1096 _keys!825 lt!108872 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108870 () ListLongMap!3095)

(declare-fun lt!108874 () ListLongMap!3095)

(assert (=> b!211645 (and (= lt!108870 lt!108874) (= lt!108874 lt!108870))))

(declare-fun lt!108869 () ListLongMap!3095)

(declare-fun v!520 () V!6901)

(declare-fun +!566 (ListLongMap!3095 tuple2!4182) ListLongMap!3095)

(assert (=> b!211645 (= lt!108874 (+!566 lt!108869 (tuple2!4183 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6424 0))(
  ( (Unit!6425) )
))
(declare-fun lt!108868 () Unit!6424)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 (array!10083 array!10085 (_ BitVec 32) (_ BitVec 32) V!6901 V!6901 (_ BitVec 32) (_ BitVec 64) V!6901 (_ BitVec 32) Int) Unit!6424)

(assert (=> b!211645 (= lt!108868 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!498 (array!10083 array!10085 (_ BitVec 32) (_ BitVec 32) V!6901 V!6901 (_ BitVec 32) Int) ListLongMap!3095)

(assert (=> b!211645 (= lt!108870 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108872 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211645 (= lt!108872 (array!10086 (store (arr!4787 _values!649) i!601 (ValueCellFull!2377 v!520)) (size!5112 _values!649)))))

(assert (=> b!211645 (= lt!108869 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211646 () Bool)

(declare-fun lt!108867 () tuple2!4182)

(declare-fun e!137752 () Bool)

(assert (=> b!211646 (= e!137752 (= lt!108873 (+!566 lt!108869 lt!108867)))))

(declare-fun b!211647 () Bool)

(declare-fun res!103377 () Bool)

(assert (=> b!211647 (=> (not res!103377) (not e!137754))))

(assert (=> b!211647 (= res!103377 (= (select (arr!4786 _keys!825) i!601) k!843))))

(declare-fun b!211648 () Bool)

(assert (=> b!211648 (= e!137756 (= lt!108871 (+!566 lt!108874 lt!108867)))))

(assert (=> b!211648 e!137752))

(declare-fun res!103379 () Bool)

(assert (=> b!211648 (=> (not res!103379) (not e!137752))))

(assert (=> b!211648 (= res!103379 (= lt!108871 (+!566 lt!108870 lt!108867)))))

(assert (=> b!211648 (= lt!108867 (tuple2!4183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211649 () Bool)

(declare-fun e!137751 () Bool)

(assert (=> b!211649 (= e!137755 (and e!137751 mapRes!9248))))

(declare-fun condMapEmpty!9248 () Bool)

(declare-fun mapDefault!9248 () ValueCell!2377)

