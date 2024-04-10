; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40774 () Bool)

(assert start!40774)

(declare-fun b_free!10763 () Bool)

(declare-fun b_next!10763 () Bool)

(assert (=> start!40774 (= b_free!10763 (not b_next!10763))))

(declare-fun tp!38111 () Bool)

(declare-fun b_and!18813 () Bool)

(assert (=> start!40774 (= tp!38111 b_and!18813)))

(declare-datatypes ((array!28009 0))(
  ( (array!28010 (arr!13449 (Array (_ BitVec 32) (_ BitVec 64))) (size!13801 (_ BitVec 32))) )
))
(declare-fun lt!205043 () array!28009)

(declare-datatypes ((V!17239 0))(
  ( (V!17240 (val!6095 Int)) )
))
(declare-fun minValue!515 () V!17239)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8018 0))(
  ( (tuple2!8019 (_1!4020 (_ BitVec 64)) (_2!4020 V!17239)) )
))
(declare-datatypes ((List!8078 0))(
  ( (Nil!8075) (Cons!8074 (h!8930 tuple2!8018) (t!13864 List!8078)) )
))
(declare-datatypes ((ListLongMap!6931 0))(
  ( (ListLongMap!6932 (toList!3481 List!8078)) )
))
(declare-fun call!29902 () ListLongMap!6931)

(declare-datatypes ((ValueCell!5707 0))(
  ( (ValueCellFull!5707 (v!8354 V!17239)) (EmptyCell!5707) )
))
(declare-datatypes ((array!28011 0))(
  ( (array!28012 (arr!13450 (Array (_ BitVec 32) ValueCell!5707)) (size!13802 (_ BitVec 32))) )
))
(declare-fun lt!205041 () array!28011)

(declare-fun _values!549 () array!28011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!28009)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29899 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!56093 () Bool)

(declare-fun zeroValue!515 () V!17239)

(declare-fun getCurrentListMapNoExtraKeys!1665 (array!28009 array!28011 (_ BitVec 32) (_ BitVec 32) V!17239 V!17239 (_ BitVec 32) Int) ListLongMap!6931)

(assert (=> bm!29899 (= call!29902 (getCurrentListMapNoExtraKeys!1665 (ite c!56093 _keys!709 lt!205043) (ite c!56093 _values!549 lt!205041) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451881 () Bool)

(declare-fun res!269090 () Bool)

(declare-fun e!264656 () Bool)

(assert (=> b!451881 (=> (not res!269090) (not e!264656))))

(declare-datatypes ((List!8079 0))(
  ( (Nil!8076) (Cons!8075 (h!8931 (_ BitVec 64)) (t!13865 List!8079)) )
))
(declare-fun arrayNoDuplicates!0 (array!28009 (_ BitVec 32) List!8079) Bool)

(assert (=> b!451881 (= res!269090 (arrayNoDuplicates!0 lt!205043 #b00000000000000000000000000000000 Nil!8076))))

(declare-fun res!269099 () Bool)

(declare-fun e!264661 () Bool)

(assert (=> start!40774 (=> (not res!269099) (not e!264661))))

(assert (=> start!40774 (= res!269099 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13801 _keys!709))))))

(assert (=> start!40774 e!264661))

(declare-fun tp_is_empty!12101 () Bool)

(assert (=> start!40774 tp_is_empty!12101))

(assert (=> start!40774 tp!38111))

(assert (=> start!40774 true))

(declare-fun e!264660 () Bool)

(declare-fun array_inv!9738 (array!28011) Bool)

(assert (=> start!40774 (and (array_inv!9738 _values!549) e!264660)))

(declare-fun array_inv!9739 (array!28009) Bool)

(assert (=> start!40774 (array_inv!9739 _keys!709)))

(declare-fun b!451882 () Bool)

(declare-fun res!269097 () Bool)

(assert (=> b!451882 (=> (not res!269097) (not e!264661))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451882 (= res!269097 (validKeyInArray!0 k!794))))

(declare-fun b!451883 () Bool)

(declare-fun e!264658 () Bool)

(declare-fun mapRes!19788 () Bool)

(assert (=> b!451883 (= e!264660 (and e!264658 mapRes!19788))))

(declare-fun condMapEmpty!19788 () Bool)

(declare-fun mapDefault!19788 () ValueCell!5707)

