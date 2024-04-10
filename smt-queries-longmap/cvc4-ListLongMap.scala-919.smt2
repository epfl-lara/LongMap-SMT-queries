; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20614 () Bool)

(assert start!20614)

(declare-fun b_free!5273 () Bool)

(declare-fun b_next!5273 () Bool)

(assert (=> start!20614 (= b_free!5273 (not b_next!5273))))

(declare-fun tp!18851 () Bool)

(declare-fun b_and!12019 () Bool)

(assert (=> start!20614 (= tp!18851 b_and!12019)))

(declare-fun b!205560 () Bool)

(declare-fun e!134417 () Bool)

(declare-fun tp_is_empty!5129 () Bool)

(assert (=> b!205560 (= e!134417 tp_is_empty!5129)))

(declare-fun b!205561 () Bool)

(declare-fun e!134414 () Bool)

(declare-fun e!134415 () Bool)

(assert (=> b!205561 (= e!134414 (not e!134415))))

(declare-fun res!99350 () Bool)

(assert (=> b!205561 (=> res!99350 e!134415)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205561 (= res!99350 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6485 0))(
  ( (V!6486 (val!2609 Int)) )
))
(declare-datatypes ((ValueCell!2221 0))(
  ( (ValueCellFull!2221 (v!4579 V!6485)) (EmptyCell!2221) )
))
(declare-datatypes ((array!9471 0))(
  ( (array!9472 (arr!4486 (Array (_ BitVec 32) ValueCell!2221)) (size!4811 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9471)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3960 0))(
  ( (tuple2!3961 (_1!1991 (_ BitVec 64)) (_2!1991 V!6485)) )
))
(declare-datatypes ((List!2856 0))(
  ( (Nil!2853) (Cons!2852 (h!3494 tuple2!3960) (t!7787 List!2856)) )
))
(declare-datatypes ((ListLongMap!2873 0))(
  ( (ListLongMap!2874 (toList!1452 List!2856)) )
))
(declare-fun lt!104700 () ListLongMap!2873)

(declare-fun zeroValue!615 () V!6485)

(declare-datatypes ((array!9473 0))(
  ( (array!9474 (arr!4487 (Array (_ BitVec 32) (_ BitVec 64))) (size!4812 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9473)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6485)

(declare-fun getCurrentListMap!1023 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6485 V!6485 (_ BitVec 32) Int) ListLongMap!2873)

(assert (=> b!205561 (= lt!104700 (getCurrentListMap!1023 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104698 () array!9471)

(declare-fun lt!104702 () ListLongMap!2873)

(assert (=> b!205561 (= lt!104702 (getCurrentListMap!1023 _keys!825 lt!104698 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104699 () ListLongMap!2873)

(declare-fun lt!104703 () ListLongMap!2873)

(assert (=> b!205561 (and (= lt!104699 lt!104703) (= lt!104703 lt!104699))))

(declare-fun lt!104701 () ListLongMap!2873)

(declare-fun lt!104694 () tuple2!3960)

(declare-fun +!479 (ListLongMap!2873 tuple2!3960) ListLongMap!2873)

(assert (=> b!205561 (= lt!104703 (+!479 lt!104701 lt!104694))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6485)

(assert (=> b!205561 (= lt!104694 (tuple2!3961 k!843 v!520))))

(declare-datatypes ((Unit!6250 0))(
  ( (Unit!6251) )
))
(declare-fun lt!104692 () Unit!6250)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!136 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6485 V!6485 (_ BitVec 32) (_ BitVec 64) V!6485 (_ BitVec 32) Int) Unit!6250)

(assert (=> b!205561 (= lt!104692 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!136 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!397 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6485 V!6485 (_ BitVec 32) Int) ListLongMap!2873)

(assert (=> b!205561 (= lt!104699 (getCurrentListMapNoExtraKeys!397 _keys!825 lt!104698 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205561 (= lt!104698 (array!9472 (store (arr!4486 _values!649) i!601 (ValueCellFull!2221 v!520)) (size!4811 _values!649)))))

(assert (=> b!205561 (= lt!104701 (getCurrentListMapNoExtraKeys!397 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205562 () Bool)

(declare-fun res!99348 () Bool)

(assert (=> b!205562 (=> (not res!99348) (not e!134414))))

(assert (=> b!205562 (= res!99348 (= (select (arr!4487 _keys!825) i!601) k!843))))

(declare-fun b!205563 () Bool)

(declare-fun res!99352 () Bool)

(assert (=> b!205563 (=> (not res!99352) (not e!134414))))

(assert (=> b!205563 (= res!99352 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4812 _keys!825))))))

(declare-fun res!99353 () Bool)

(assert (=> start!20614 (=> (not res!99353) (not e!134414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20614 (= res!99353 (validMask!0 mask!1149))))

(assert (=> start!20614 e!134414))

(declare-fun e!134416 () Bool)

(declare-fun array_inv!2967 (array!9471) Bool)

(assert (=> start!20614 (and (array_inv!2967 _values!649) e!134416)))

(assert (=> start!20614 true))

(assert (=> start!20614 tp_is_empty!5129))

(declare-fun array_inv!2968 (array!9473) Bool)

(assert (=> start!20614 (array_inv!2968 _keys!825)))

(assert (=> start!20614 tp!18851))

(declare-fun b!205564 () Bool)

(declare-fun res!99347 () Bool)

(assert (=> b!205564 (=> (not res!99347) (not e!134414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205564 (= res!99347 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8762 () Bool)

(declare-fun mapRes!8762 () Bool)

(assert (=> mapIsEmpty!8762 mapRes!8762))

(declare-fun b!205565 () Bool)

(declare-fun e!134420 () Bool)

(assert (=> b!205565 (= e!134415 e!134420)))

(declare-fun res!99349 () Bool)

(assert (=> b!205565 (=> res!99349 e!134420)))

(assert (=> b!205565 (= res!99349 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104693 () ListLongMap!2873)

(assert (=> b!205565 (= lt!104700 lt!104693)))

(declare-fun lt!104696 () tuple2!3960)

(assert (=> b!205565 (= lt!104693 (+!479 lt!104701 lt!104696))))

(declare-fun lt!104697 () ListLongMap!2873)

(assert (=> b!205565 (= lt!104702 lt!104697)))

(assert (=> b!205565 (= lt!104697 (+!479 lt!104703 lt!104696))))

(assert (=> b!205565 (= lt!104702 (+!479 lt!104699 lt!104696))))

(assert (=> b!205565 (= lt!104696 (tuple2!3961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205566 () Bool)

(assert (=> b!205566 (= e!134420 true)))

(assert (=> b!205566 (= lt!104697 (+!479 lt!104693 lt!104694))))

(declare-fun lt!104695 () Unit!6250)

(declare-fun addCommutativeForDiffKeys!179 (ListLongMap!2873 (_ BitVec 64) V!6485 (_ BitVec 64) V!6485) Unit!6250)

(assert (=> b!205566 (= lt!104695 (addCommutativeForDiffKeys!179 lt!104701 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205567 () Bool)

(declare-fun res!99355 () Bool)

(assert (=> b!205567 (=> (not res!99355) (not e!134414))))

(assert (=> b!205567 (= res!99355 (and (= (size!4811 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4812 _keys!825) (size!4811 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205568 () Bool)

(assert (=> b!205568 (= e!134416 (and e!134417 mapRes!8762))))

(declare-fun condMapEmpty!8762 () Bool)

(declare-fun mapDefault!8762 () ValueCell!2221)

