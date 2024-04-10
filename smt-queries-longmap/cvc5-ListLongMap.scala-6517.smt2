; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82942 () Bool)

(assert start!82942)

(declare-fun b_free!19069 () Bool)

(declare-fun b_next!19069 () Bool)

(assert (=> start!82942 (= b_free!19069 (not b_next!19069))))

(declare-fun tp!66336 () Bool)

(declare-fun b_and!30557 () Bool)

(assert (=> start!82942 (= tp!66336 b_and!30557)))

(declare-fun b!967977 () Bool)

(declare-fun res!648008 () Bool)

(declare-fun e!545529 () Bool)

(assert (=> b!967977 (=> (not res!648008) (not e!545529))))

(declare-datatypes ((array!59827 0))(
  ( (array!59828 (arr!28782 (Array (_ BitVec 32) (_ BitVec 64))) (size!29261 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59827)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967977 (= res!648008 (validKeyInArray!0 (select (arr!28782 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34810 () Bool)

(declare-fun mapRes!34810 () Bool)

(assert (=> mapIsEmpty!34810 mapRes!34810))

(declare-fun b!967978 () Bool)

(declare-fun e!545528 () Bool)

(declare-fun tp_is_empty!21877 () Bool)

(assert (=> b!967978 (= e!545528 tp_is_empty!21877)))

(declare-fun res!648004 () Bool)

(assert (=> start!82942 (=> (not res!648004) (not e!545529))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82942 (= res!648004 (validMask!0 mask!2110))))

(assert (=> start!82942 e!545529))

(assert (=> start!82942 true))

(declare-datatypes ((V!34153 0))(
  ( (V!34154 (val!10989 Int)) )
))
(declare-datatypes ((ValueCell!10457 0))(
  ( (ValueCellFull!10457 (v!13547 V!34153)) (EmptyCell!10457) )
))
(declare-datatypes ((array!59829 0))(
  ( (array!59830 (arr!28783 (Array (_ BitVec 32) ValueCell!10457)) (size!29262 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59829)

(declare-fun e!545527 () Bool)

(declare-fun array_inv!22283 (array!59829) Bool)

(assert (=> start!82942 (and (array_inv!22283 _values!1400) e!545527)))

(declare-fun array_inv!22284 (array!59827) Bool)

(assert (=> start!82942 (array_inv!22284 _keys!1686)))

(assert (=> start!82942 tp!66336))

(assert (=> start!82942 tp_is_empty!21877))

(declare-fun b!967979 () Bool)

(declare-fun res!648006 () Bool)

(assert (=> b!967979 (=> (not res!648006) (not e!545529))))

(declare-datatypes ((List!19984 0))(
  ( (Nil!19981) (Cons!19980 (h!21142 (_ BitVec 64)) (t!28347 List!19984)) )
))
(declare-fun arrayNoDuplicates!0 (array!59827 (_ BitVec 32) List!19984) Bool)

(assert (=> b!967979 (= res!648006 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19981))))

(declare-fun b!967980 () Bool)

(declare-fun res!648003 () Bool)

(assert (=> b!967980 (=> (not res!648003) (not e!545529))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967980 (= res!648003 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29261 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29261 _keys!1686))))))

(declare-fun mapNonEmpty!34810 () Bool)

(declare-fun tp!66335 () Bool)

(assert (=> mapNonEmpty!34810 (= mapRes!34810 (and tp!66335 e!545528))))

(declare-fun mapRest!34810 () (Array (_ BitVec 32) ValueCell!10457))

(declare-fun mapValue!34810 () ValueCell!10457)

(declare-fun mapKey!34810 () (_ BitVec 32))

(assert (=> mapNonEmpty!34810 (= (arr!28783 _values!1400) (store mapRest!34810 mapKey!34810 mapValue!34810))))

(declare-fun b!967981 () Bool)

(declare-fun res!648009 () Bool)

(assert (=> b!967981 (=> (not res!648009) (not e!545529))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967981 (= res!648009 (and (= (size!29262 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29261 _keys!1686) (size!29262 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967982 () Bool)

(assert (=> b!967982 (= e!545529 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29261 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001)) (bvslt (bvsub (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159) (bvsub from!2084 newFrom!159)))))))

(declare-fun minValue!1342 () V!34153)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34153)

(declare-datatypes ((tuple2!14136 0))(
  ( (tuple2!14137 (_1!7079 (_ BitVec 64)) (_2!7079 V!34153)) )
))
(declare-datatypes ((List!19985 0))(
  ( (Nil!19982) (Cons!19981 (h!21143 tuple2!14136) (t!28348 List!19985)) )
))
(declare-datatypes ((ListLongMap!12833 0))(
  ( (ListLongMap!12834 (toList!6432 List!19985)) )
))
(declare-fun contains!5533 (ListLongMap!12833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3665 (array!59827 array!59829 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) Int) ListLongMap!12833)

(assert (=> b!967982 (contains!5533 (getCurrentListMap!3665 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28782 _keys!1686) i!803))))

(declare-datatypes ((Unit!32345 0))(
  ( (Unit!32346) )
))
(declare-fun lt!431470 () Unit!32345)

(declare-fun lemmaInListMapFromThenInFromMinusOne!67 (array!59827 array!59829 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) (_ BitVec 32) Int) Unit!32345)

(assert (=> b!967982 (= lt!431470 (lemmaInListMapFromThenInFromMinusOne!67 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967983 () Bool)

(declare-fun res!648007 () Bool)

(assert (=> b!967983 (=> (not res!648007) (not e!545529))))

(assert (=> b!967983 (= res!648007 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967984 () Bool)

(declare-fun res!648005 () Bool)

(assert (=> b!967984 (=> (not res!648005) (not e!545529))))

(assert (=> b!967984 (= res!648005 (contains!5533 (getCurrentListMap!3665 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28782 _keys!1686) i!803)))))

(declare-fun b!967985 () Bool)

(declare-fun res!648010 () Bool)

(assert (=> b!967985 (=> (not res!648010) (not e!545529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59827 (_ BitVec 32)) Bool)

(assert (=> b!967985 (= res!648010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967986 () Bool)

(declare-fun e!545530 () Bool)

(assert (=> b!967986 (= e!545530 tp_is_empty!21877)))

(declare-fun b!967987 () Bool)

(assert (=> b!967987 (= e!545527 (and e!545530 mapRes!34810))))

(declare-fun condMapEmpty!34810 () Bool)

(declare-fun mapDefault!34810 () ValueCell!10457)

