; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20634 () Bool)

(assert start!20634)

(declare-fun b_free!5293 () Bool)

(declare-fun b_next!5293 () Bool)

(assert (=> start!20634 (= b_free!5293 (not b_next!5293))))

(declare-fun tp!18911 () Bool)

(declare-fun b_and!12039 () Bool)

(assert (=> start!20634 (= tp!18911 b_and!12039)))

(declare-fun b!205920 () Bool)

(declare-fun e!134630 () Bool)

(declare-fun e!134624 () Bool)

(assert (=> b!205920 (= e!134630 e!134624)))

(declare-fun res!99621 () Bool)

(assert (=> b!205920 (=> res!99621 e!134624)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!205920 (= res!99621 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6513 0))(
  ( (V!6514 (val!2619 Int)) )
))
(declare-datatypes ((tuple2!3974 0))(
  ( (tuple2!3975 (_1!1998 (_ BitVec 64)) (_2!1998 V!6513)) )
))
(declare-datatypes ((List!2868 0))(
  ( (Nil!2865) (Cons!2864 (h!3506 tuple2!3974) (t!7799 List!2868)) )
))
(declare-datatypes ((ListLongMap!2887 0))(
  ( (ListLongMap!2888 (toList!1459 List!2868)) )
))
(declare-fun lt!105055 () ListLongMap!2887)

(declare-fun lt!105062 () ListLongMap!2887)

(assert (=> b!205920 (= lt!105055 lt!105062)))

(declare-fun lt!105056 () ListLongMap!2887)

(declare-fun lt!105054 () tuple2!3974)

(declare-fun +!486 (ListLongMap!2887 tuple2!3974) ListLongMap!2887)

(assert (=> b!205920 (= lt!105062 (+!486 lt!105056 lt!105054))))

(declare-fun lt!105053 () ListLongMap!2887)

(declare-fun lt!105059 () ListLongMap!2887)

(assert (=> b!205920 (= lt!105053 lt!105059)))

(declare-fun lt!105063 () ListLongMap!2887)

(assert (=> b!205920 (= lt!105059 (+!486 lt!105063 lt!105054))))

(declare-fun lt!105057 () ListLongMap!2887)

(assert (=> b!205920 (= lt!105053 (+!486 lt!105057 lt!105054))))

(declare-fun minValue!615 () V!6513)

(assert (=> b!205920 (= lt!105054 (tuple2!3975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205921 () Bool)

(declare-fun res!99623 () Bool)

(declare-fun e!134626 () Bool)

(assert (=> b!205921 (=> (not res!99623) (not e!134626))))

(declare-datatypes ((array!9509 0))(
  ( (array!9510 (arr!4505 (Array (_ BitVec 32) (_ BitVec 64))) (size!4830 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9509)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205921 (= res!99623 (= (select (arr!4505 _keys!825) i!601) k!843))))

(declare-fun res!99625 () Bool)

(assert (=> start!20634 (=> (not res!99625) (not e!134626))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20634 (= res!99625 (validMask!0 mask!1149))))

(assert (=> start!20634 e!134626))

(declare-datatypes ((ValueCell!2231 0))(
  ( (ValueCellFull!2231 (v!4589 V!6513)) (EmptyCell!2231) )
))
(declare-datatypes ((array!9511 0))(
  ( (array!9512 (arr!4506 (Array (_ BitVec 32) ValueCell!2231)) (size!4831 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9511)

(declare-fun e!134625 () Bool)

(declare-fun array_inv!2977 (array!9511) Bool)

(assert (=> start!20634 (and (array_inv!2977 _values!649) e!134625)))

(assert (=> start!20634 true))

(declare-fun tp_is_empty!5149 () Bool)

(assert (=> start!20634 tp_is_empty!5149))

(declare-fun array_inv!2978 (array!9509) Bool)

(assert (=> start!20634 (array_inv!2978 _keys!825)))

(assert (=> start!20634 tp!18911))

(declare-fun b!205922 () Bool)

(declare-fun res!99620 () Bool)

(assert (=> b!205922 (=> (not res!99620) (not e!134626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205922 (= res!99620 (validKeyInArray!0 k!843))))

(declare-fun b!205923 () Bool)

(assert (=> b!205923 (= e!134624 true)))

(declare-fun lt!105061 () tuple2!3974)

(assert (=> b!205923 (= lt!105059 (+!486 lt!105062 lt!105061))))

(declare-datatypes ((Unit!6262 0))(
  ( (Unit!6263) )
))
(declare-fun lt!105058 () Unit!6262)

(declare-fun v!520 () V!6513)

(declare-fun addCommutativeForDiffKeys!185 (ListLongMap!2887 (_ BitVec 64) V!6513 (_ BitVec 64) V!6513) Unit!6262)

(assert (=> b!205923 (= lt!105058 (addCommutativeForDiffKeys!185 lt!105056 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205924 () Bool)

(declare-fun e!134628 () Bool)

(assert (=> b!205924 (= e!134628 tp_is_empty!5149)))

(declare-fun b!205925 () Bool)

(declare-fun res!99617 () Bool)

(assert (=> b!205925 (=> (not res!99617) (not e!134626))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205925 (= res!99617 (and (= (size!4831 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4830 _keys!825) (size!4831 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205926 () Bool)

(declare-fun res!99622 () Bool)

(assert (=> b!205926 (=> (not res!99622) (not e!134626))))

(assert (=> b!205926 (= res!99622 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4830 _keys!825))))))

(declare-fun b!205927 () Bool)

(assert (=> b!205927 (= e!134626 (not e!134630))))

(declare-fun res!99618 () Bool)

(assert (=> b!205927 (=> res!99618 e!134630)))

(assert (=> b!205927 (= res!99618 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6513)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1029 (array!9509 array!9511 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2887)

(assert (=> b!205927 (= lt!105055 (getCurrentListMap!1029 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105060 () array!9511)

(assert (=> b!205927 (= lt!105053 (getCurrentListMap!1029 _keys!825 lt!105060 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205927 (and (= lt!105057 lt!105063) (= lt!105063 lt!105057))))

(assert (=> b!205927 (= lt!105063 (+!486 lt!105056 lt!105061))))

(assert (=> b!205927 (= lt!105061 (tuple2!3975 k!843 v!520))))

(declare-fun lt!105052 () Unit!6262)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!142 (array!9509 array!9511 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) (_ BitVec 64) V!6513 (_ BitVec 32) Int) Unit!6262)

(assert (=> b!205927 (= lt!105052 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!142 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!403 (array!9509 array!9511 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2887)

(assert (=> b!205927 (= lt!105057 (getCurrentListMapNoExtraKeys!403 _keys!825 lt!105060 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205927 (= lt!105060 (array!9512 (store (arr!4506 _values!649) i!601 (ValueCellFull!2231 v!520)) (size!4831 _values!649)))))

(assert (=> b!205927 (= lt!105056 (getCurrentListMapNoExtraKeys!403 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205928 () Bool)

(declare-fun mapRes!8792 () Bool)

(assert (=> b!205928 (= e!134625 (and e!134628 mapRes!8792))))

(declare-fun condMapEmpty!8792 () Bool)

(declare-fun mapDefault!8792 () ValueCell!2231)

