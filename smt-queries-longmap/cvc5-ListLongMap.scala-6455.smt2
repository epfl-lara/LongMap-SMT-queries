; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82570 () Bool)

(assert start!82570)

(declare-fun b_free!18703 () Bool)

(declare-fun b_next!18703 () Bool)

(assert (=> start!82570 (= b_free!18703 (not b_next!18703))))

(declare-fun tp!65228 () Bool)

(declare-fun b_and!30191 () Bool)

(assert (=> start!82570 (= tp!65228 b_and!30191)))

(declare-fun b!962276 () Bool)

(declare-fun res!643979 () Bool)

(declare-fun e!542660 () Bool)

(assert (=> b!962276 (=> (not res!643979) (not e!542660))))

(declare-datatypes ((array!59107 0))(
  ( (array!59108 (arr!28422 (Array (_ BitVec 32) (_ BitVec 64))) (size!28901 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59107)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962276 (= res!643979 (validKeyInArray!0 (select (arr!28422 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34252 () Bool)

(declare-fun mapRes!34252 () Bool)

(declare-fun tp!65229 () Bool)

(declare-fun e!542657 () Bool)

(assert (=> mapNonEmpty!34252 (= mapRes!34252 (and tp!65229 e!542657))))

(declare-datatypes ((V!33657 0))(
  ( (V!33658 (val!10803 Int)) )
))
(declare-datatypes ((ValueCell!10271 0))(
  ( (ValueCellFull!10271 (v!13361 V!33657)) (EmptyCell!10271) )
))
(declare-datatypes ((array!59109 0))(
  ( (array!59110 (arr!28423 (Array (_ BitVec 32) ValueCell!10271)) (size!28902 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59109)

(declare-fun mapKey!34252 () (_ BitVec 32))

(declare-fun mapRest!34252 () (Array (_ BitVec 32) ValueCell!10271))

(declare-fun mapValue!34252 () ValueCell!10271)

(assert (=> mapNonEmpty!34252 (= (arr!28423 _values!1400) (store mapRest!34252 mapKey!34252 mapValue!34252))))

(declare-fun b!962277 () Bool)

(declare-fun e!542656 () Bool)

(declare-fun tp_is_empty!21505 () Bool)

(assert (=> b!962277 (= e!542656 tp_is_empty!21505)))

(declare-fun b!962278 () Bool)

(declare-fun res!643980 () Bool)

(assert (=> b!962278 (=> (not res!643980) (not e!542660))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962278 (= res!643980 (and (= (size!28902 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28901 _keys!1686) (size!28902 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962279 () Bool)

(declare-fun res!643977 () Bool)

(assert (=> b!962279 (=> (not res!643977) (not e!542660))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962279 (= res!643977 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28901 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28901 _keys!1686))))))

(declare-fun res!643978 () Bool)

(assert (=> start!82570 (=> (not res!643978) (not e!542660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82570 (= res!643978 (validMask!0 mask!2110))))

(assert (=> start!82570 e!542660))

(assert (=> start!82570 true))

(declare-fun e!542659 () Bool)

(declare-fun array_inv!22023 (array!59109) Bool)

(assert (=> start!82570 (and (array_inv!22023 _values!1400) e!542659)))

(declare-fun array_inv!22024 (array!59107) Bool)

(assert (=> start!82570 (array_inv!22024 _keys!1686)))

(assert (=> start!82570 tp!65228))

(assert (=> start!82570 tp_is_empty!21505))

(declare-fun b!962280 () Bool)

(assert (=> b!962280 (= e!542660 false)))

(declare-fun minValue!1342 () V!33657)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430858 () Bool)

(declare-fun zeroValue!1342 () V!33657)

(declare-datatypes ((tuple2!13874 0))(
  ( (tuple2!13875 (_1!6948 (_ BitVec 64)) (_2!6948 V!33657)) )
))
(declare-datatypes ((List!19725 0))(
  ( (Nil!19722) (Cons!19721 (h!20883 tuple2!13874) (t!28088 List!19725)) )
))
(declare-datatypes ((ListLongMap!12571 0))(
  ( (ListLongMap!12572 (toList!6301 List!19725)) )
))
(declare-fun contains!5404 (ListLongMap!12571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3534 (array!59107 array!59109 (_ BitVec 32) (_ BitVec 32) V!33657 V!33657 (_ BitVec 32) Int) ListLongMap!12571)

(assert (=> b!962280 (= lt!430858 (contains!5404 (getCurrentListMap!3534 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28422 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34252 () Bool)

(assert (=> mapIsEmpty!34252 mapRes!34252))

(declare-fun b!962281 () Bool)

(declare-fun res!643981 () Bool)

(assert (=> b!962281 (=> (not res!643981) (not e!542660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59107 (_ BitVec 32)) Bool)

(assert (=> b!962281 (= res!643981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962282 () Bool)

(assert (=> b!962282 (= e!542657 tp_is_empty!21505)))

(declare-fun b!962283 () Bool)

(assert (=> b!962283 (= e!542659 (and e!542656 mapRes!34252))))

(declare-fun condMapEmpty!34252 () Bool)

(declare-fun mapDefault!34252 () ValueCell!10271)

