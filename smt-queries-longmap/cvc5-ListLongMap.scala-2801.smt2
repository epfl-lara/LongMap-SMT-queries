; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40694 () Bool)

(assert start!40694)

(declare-fun b_free!10705 () Bool)

(declare-fun b_next!10705 () Bool)

(assert (=> start!40694 (= b_free!10705 (not b_next!10705))))

(declare-fun tp!37935 () Bool)

(declare-fun b_and!18713 () Bool)

(assert (=> start!40694 (= tp!37935 b_and!18713)))

(declare-fun b!450065 () Bool)

(declare-fun res!267830 () Bool)

(declare-fun e!263786 () Bool)

(assert (=> b!450065 (=> (not res!267830) (not e!263786))))

(declare-datatypes ((array!27893 0))(
  ( (array!27894 (arr!13392 (Array (_ BitVec 32) (_ BitVec 64))) (size!13744 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27893)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27893 (_ BitVec 32)) Bool)

(assert (=> b!450065 (= res!267830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450066 () Bool)

(declare-fun res!267821 () Bool)

(assert (=> b!450066 (=> (not res!267821) (not e!263786))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17163 0))(
  ( (V!17164 (val!6066 Int)) )
))
(declare-datatypes ((ValueCell!5678 0))(
  ( (ValueCellFull!5678 (v!8321 V!17163)) (EmptyCell!5678) )
))
(declare-datatypes ((array!27895 0))(
  ( (array!27896 (arr!13393 (Array (_ BitVec 32) ValueCell!5678)) (size!13745 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27895)

(assert (=> b!450066 (= res!267821 (and (= (size!13745 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13744 _keys!709) (size!13745 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!17163)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204509 () array!27895)

(declare-fun zeroValue!515 () V!17163)

(declare-fun c!55964 () Bool)

(declare-fun lt!204508 () array!27893)

(declare-datatypes ((tuple2!7964 0))(
  ( (tuple2!7965 (_1!3993 (_ BitVec 64)) (_2!3993 V!17163)) )
))
(declare-datatypes ((List!8032 0))(
  ( (Nil!8029) (Cons!8028 (h!8884 tuple2!7964) (t!13794 List!8032)) )
))
(declare-datatypes ((ListLongMap!6877 0))(
  ( (ListLongMap!6878 (toList!3454 List!8032)) )
))
(declare-fun call!29708 () ListLongMap!6877)

(declare-fun bm!29704 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1640 (array!27893 array!27895 (_ BitVec 32) (_ BitVec 32) V!17163 V!17163 (_ BitVec 32) Int) ListLongMap!6877)

(assert (=> bm!29704 (= call!29708 (getCurrentListMapNoExtraKeys!1640 (ite c!55964 lt!204508 _keys!709) (ite c!55964 lt!204509 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450067 () Bool)

(declare-fun res!267826 () Bool)

(declare-fun e!263792 () Bool)

(assert (=> b!450067 (=> (not res!267826) (not e!263792))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450067 (= res!267826 (bvsle from!863 i!563))))

(declare-fun b!450068 () Bool)

(declare-fun e!263785 () Bool)

(declare-fun tp_is_empty!12043 () Bool)

(assert (=> b!450068 (= e!263785 tp_is_empty!12043)))

(declare-fun b!450069 () Bool)

(assert (=> b!450069 (= e!263786 e!263792)))

(declare-fun res!267820 () Bool)

(assert (=> b!450069 (=> (not res!267820) (not e!263792))))

(assert (=> b!450069 (= res!267820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204508 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!450069 (= lt!204508 (array!27894 (store (arr!13392 _keys!709) i!563 k!794) (size!13744 _keys!709)))))

(declare-fun e!263789 () Bool)

(declare-fun v!412 () V!17163)

(declare-fun call!29707 () ListLongMap!6877)

(declare-fun b!450070 () Bool)

(declare-fun +!1538 (ListLongMap!6877 tuple2!7964) ListLongMap!6877)

(assert (=> b!450070 (= e!263789 (= call!29708 (+!1538 call!29707 (tuple2!7965 k!794 v!412))))))

(declare-fun b!450071 () Bool)

(declare-fun e!263787 () Bool)

(assert (=> b!450071 (= e!263787 tp_is_empty!12043)))

(declare-fun b!450073 () Bool)

(declare-fun res!267827 () Bool)

(assert (=> b!450073 (=> (not res!267827) (not e!263792))))

(declare-datatypes ((List!8033 0))(
  ( (Nil!8030) (Cons!8029 (h!8885 (_ BitVec 64)) (t!13795 List!8033)) )
))
(declare-fun arrayNoDuplicates!0 (array!27893 (_ BitVec 32) List!8033) Bool)

(assert (=> b!450073 (= res!267827 (arrayNoDuplicates!0 lt!204508 #b00000000000000000000000000000000 Nil!8030))))

(declare-fun mapIsEmpty!19698 () Bool)

(declare-fun mapRes!19698 () Bool)

(assert (=> mapIsEmpty!19698 mapRes!19698))

(declare-fun b!450074 () Bool)

(assert (=> b!450074 (= e!263789 (= call!29707 call!29708))))

(declare-fun b!450075 () Bool)

(declare-fun res!267822 () Bool)

(assert (=> b!450075 (=> (not res!267822) (not e!263786))))

(assert (=> b!450075 (= res!267822 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8030))))

(declare-fun b!450076 () Bool)

(declare-fun e!263791 () Bool)

(assert (=> b!450076 (= e!263791 (and e!263785 mapRes!19698))))

(declare-fun condMapEmpty!19698 () Bool)

(declare-fun mapDefault!19698 () ValueCell!5678)

