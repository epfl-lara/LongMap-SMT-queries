; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40566 () Bool)

(assert start!40566)

(declare-fun b_free!10577 () Bool)

(declare-fun b_next!10577 () Bool)

(assert (=> start!40566 (= b_free!10577 (not b_next!10577))))

(declare-fun tp!37550 () Bool)

(declare-fun b_and!18585 () Bool)

(assert (=> start!40566 (= tp!37550 b_and!18585)))

(declare-fun b!447152 () Bool)

(declare-fun e!262616 () Bool)

(declare-fun e!262615 () Bool)

(assert (=> b!447152 (= e!262616 e!262615)))

(declare-fun res!265504 () Bool)

(assert (=> b!447152 (=> (not res!265504) (not e!262615))))

(declare-datatypes ((array!27637 0))(
  ( (array!27638 (arr!13264 (Array (_ BitVec 32) (_ BitVec 64))) (size!13616 (_ BitVec 32))) )
))
(declare-fun lt!203918 () array!27637)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27637 (_ BitVec 32)) Bool)

(assert (=> b!447152 (= res!265504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203918 mask!1025))))

(declare-fun _keys!709 () array!27637)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447152 (= lt!203918 (array!27638 (store (arr!13264 _keys!709) i!563 k!794) (size!13616 _keys!709)))))

(declare-fun b!447153 () Bool)

(declare-fun res!265505 () Bool)

(assert (=> b!447153 (=> (not res!265505) (not e!262615))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447153 (= res!265505 (bvsle from!863 i!563))))

(declare-fun b!447154 () Bool)

(declare-fun res!265511 () Bool)

(assert (=> b!447154 (=> (not res!265511) (not e!262616))))

(assert (=> b!447154 (= res!265511 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13616 _keys!709))))))

(declare-fun b!447155 () Bool)

(assert (=> b!447155 (= e!262615 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16991 0))(
  ( (V!16992 (val!6002 Int)) )
))
(declare-datatypes ((ValueCell!5614 0))(
  ( (ValueCellFull!5614 (v!8257 V!16991)) (EmptyCell!5614) )
))
(declare-datatypes ((array!27639 0))(
  ( (array!27640 (arr!13265 (Array (_ BitVec 32) ValueCell!5614)) (size!13617 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27639)

(declare-fun zeroValue!515 () V!16991)

(declare-fun minValue!515 () V!16991)

(declare-datatypes ((tuple2!7872 0))(
  ( (tuple2!7873 (_1!3947 (_ BitVec 64)) (_2!3947 V!16991)) )
))
(declare-datatypes ((List!7935 0))(
  ( (Nil!7932) (Cons!7931 (h!8787 tuple2!7872) (t!13697 List!7935)) )
))
(declare-datatypes ((ListLongMap!6785 0))(
  ( (ListLongMap!6786 (toList!3408 List!7935)) )
))
(declare-fun lt!203919 () ListLongMap!6785)

(declare-fun getCurrentListMapNoExtraKeys!1594 (array!27637 array!27639 (_ BitVec 32) (_ BitVec 32) V!16991 V!16991 (_ BitVec 32) Int) ListLongMap!6785)

(assert (=> b!447155 (= lt!203919 (getCurrentListMapNoExtraKeys!1594 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447156 () Bool)

(declare-fun res!265513 () Bool)

(assert (=> b!447156 (=> (not res!265513) (not e!262616))))

(assert (=> b!447156 (= res!265513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447157 () Bool)

(declare-fun e!262614 () Bool)

(declare-fun tp_is_empty!11915 () Bool)

(assert (=> b!447157 (= e!262614 tp_is_empty!11915)))

(declare-fun b!447158 () Bool)

(declare-fun res!265512 () Bool)

(assert (=> b!447158 (=> (not res!265512) (not e!262615))))

(declare-datatypes ((List!7936 0))(
  ( (Nil!7933) (Cons!7932 (h!8788 (_ BitVec 64)) (t!13698 List!7936)) )
))
(declare-fun arrayNoDuplicates!0 (array!27637 (_ BitVec 32) List!7936) Bool)

(assert (=> b!447158 (= res!265512 (arrayNoDuplicates!0 lt!203918 #b00000000000000000000000000000000 Nil!7933))))

(declare-fun b!447159 () Bool)

(declare-fun res!265514 () Bool)

(assert (=> b!447159 (=> (not res!265514) (not e!262616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447159 (= res!265514 (validMask!0 mask!1025))))

(declare-fun b!447160 () Bool)

(declare-fun res!265508 () Bool)

(assert (=> b!447160 (=> (not res!265508) (not e!262616))))

(declare-fun arrayContainsKey!0 (array!27637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447160 (= res!265508 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!447161 () Bool)

(declare-fun res!265515 () Bool)

(assert (=> b!447161 (=> (not res!265515) (not e!262616))))

(assert (=> b!447161 (= res!265515 (and (= (size!13617 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13616 _keys!709) (size!13617 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447162 () Bool)

(declare-fun e!262613 () Bool)

(declare-fun e!262611 () Bool)

(declare-fun mapRes!19506 () Bool)

(assert (=> b!447162 (= e!262613 (and e!262611 mapRes!19506))))

(declare-fun condMapEmpty!19506 () Bool)

(declare-fun mapDefault!19506 () ValueCell!5614)

