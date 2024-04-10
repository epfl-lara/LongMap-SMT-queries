; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82556 () Bool)

(assert start!82556)

(declare-fun b_free!18689 () Bool)

(declare-fun b_next!18689 () Bool)

(assert (=> start!82556 (= b_free!18689 (not b_next!18689))))

(declare-fun tp!65186 () Bool)

(declare-fun b_and!30177 () Bool)

(assert (=> start!82556 (= tp!65186 b_and!30177)))

(declare-fun b!962087 () Bool)

(declare-fun res!643852 () Bool)

(declare-fun e!542555 () Bool)

(assert (=> b!962087 (=> (not res!643852) (not e!542555))))

(declare-datatypes ((array!59079 0))(
  ( (array!59080 (arr!28408 (Array (_ BitVec 32) (_ BitVec 64))) (size!28887 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59079)

(declare-datatypes ((List!19716 0))(
  ( (Nil!19713) (Cons!19712 (h!20874 (_ BitVec 64)) (t!28079 List!19716)) )
))
(declare-fun arrayNoDuplicates!0 (array!59079 (_ BitVec 32) List!19716) Bool)

(assert (=> b!962087 (= res!643852 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19713))))

(declare-fun b!962088 () Bool)

(declare-fun e!542552 () Bool)

(declare-fun tp_is_empty!21491 () Bool)

(assert (=> b!962088 (= e!542552 tp_is_empty!21491)))

(declare-fun mapNonEmpty!34231 () Bool)

(declare-fun mapRes!34231 () Bool)

(declare-fun tp!65187 () Bool)

(assert (=> mapNonEmpty!34231 (= mapRes!34231 (and tp!65187 e!542552))))

(declare-datatypes ((V!33637 0))(
  ( (V!33638 (val!10796 Int)) )
))
(declare-datatypes ((ValueCell!10264 0))(
  ( (ValueCellFull!10264 (v!13354 V!33637)) (EmptyCell!10264) )
))
(declare-fun mapRest!34231 () (Array (_ BitVec 32) ValueCell!10264))

(declare-fun mapKey!34231 () (_ BitVec 32))

(declare-fun mapValue!34231 () ValueCell!10264)

(declare-datatypes ((array!59081 0))(
  ( (array!59082 (arr!28409 (Array (_ BitVec 32) ValueCell!10264)) (size!28888 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59081)

(assert (=> mapNonEmpty!34231 (= (arr!28409 _values!1400) (store mapRest!34231 mapKey!34231 mapValue!34231))))

(declare-fun b!962089 () Bool)

(declare-fun res!643855 () Bool)

(assert (=> b!962089 (=> (not res!643855) (not e!542555))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962089 (= res!643855 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28887 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28887 _keys!1686))))))

(declare-fun res!643854 () Bool)

(assert (=> start!82556 (=> (not res!643854) (not e!542555))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82556 (= res!643854 (validMask!0 mask!2110))))

(assert (=> start!82556 e!542555))

(assert (=> start!82556 true))

(declare-fun e!542553 () Bool)

(declare-fun array_inv!22017 (array!59081) Bool)

(assert (=> start!82556 (and (array_inv!22017 _values!1400) e!542553)))

(declare-fun array_inv!22018 (array!59079) Bool)

(assert (=> start!82556 (array_inv!22018 _keys!1686)))

(assert (=> start!82556 tp!65186))

(assert (=> start!82556 tp_is_empty!21491))

(declare-fun b!962090 () Bool)

(declare-fun e!542554 () Bool)

(assert (=> b!962090 (= e!542553 (and e!542554 mapRes!34231))))

(declare-fun condMapEmpty!34231 () Bool)

(declare-fun mapDefault!34231 () ValueCell!10264)

