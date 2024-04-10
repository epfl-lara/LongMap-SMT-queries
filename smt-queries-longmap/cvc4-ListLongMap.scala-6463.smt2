; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82622 () Bool)

(assert start!82622)

(declare-fun b_free!18755 () Bool)

(declare-fun b_next!18755 () Bool)

(assert (=> start!82622 (= b_free!18755 (not b_next!18755))))

(declare-fun tp!65384 () Bool)

(declare-fun b_and!30243 () Bool)

(assert (=> start!82622 (= tp!65384 b_and!30243)))

(declare-fun b!963030 () Bool)

(declare-fun res!644496 () Bool)

(declare-fun e!543049 () Bool)

(assert (=> b!963030 (=> (not res!644496) (not e!543049))))

(declare-datatypes ((array!59209 0))(
  ( (array!59210 (arr!28473 (Array (_ BitVec 32) (_ BitVec 64))) (size!28952 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59209)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59209 (_ BitVec 32)) Bool)

(assert (=> b!963030 (= res!644496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963031 () Bool)

(declare-fun e!543048 () Bool)

(declare-fun tp_is_empty!21557 () Bool)

(assert (=> b!963031 (= e!543048 tp_is_empty!21557)))

(declare-fun b!963032 () Bool)

(declare-fun res!644502 () Bool)

(assert (=> b!963032 (=> (not res!644502) (not e!543049))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33725 0))(
  ( (V!33726 (val!10829 Int)) )
))
(declare-datatypes ((ValueCell!10297 0))(
  ( (ValueCellFull!10297 (v!13387 V!33725)) (EmptyCell!10297) )
))
(declare-datatypes ((array!59211 0))(
  ( (array!59212 (arr!28474 (Array (_ BitVec 32) ValueCell!10297)) (size!28953 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59211)

(declare-fun minValue!1342 () V!33725)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33725)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13912 0))(
  ( (tuple2!13913 (_1!6967 (_ BitVec 64)) (_2!6967 V!33725)) )
))
(declare-datatypes ((List!19762 0))(
  ( (Nil!19759) (Cons!19758 (h!20920 tuple2!13912) (t!28125 List!19762)) )
))
(declare-datatypes ((ListLongMap!12609 0))(
  ( (ListLongMap!12610 (toList!6320 List!19762)) )
))
(declare-fun contains!5423 (ListLongMap!12609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3553 (array!59209 array!59211 (_ BitVec 32) (_ BitVec 32) V!33725 V!33725 (_ BitVec 32) Int) ListLongMap!12609)

(assert (=> b!963032 (= res!644502 (contains!5423 (getCurrentListMap!3553 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28473 _keys!1686) i!803)))))

(declare-fun b!963033 () Bool)

(declare-fun res!644500 () Bool)

(assert (=> b!963033 (=> (not res!644500) (not e!543049))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963033 (= res!644500 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28952 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28952 _keys!1686))))))

(declare-fun b!963034 () Bool)

(declare-fun e!543046 () Bool)

(assert (=> b!963034 (= e!543046 tp_is_empty!21557)))

(declare-fun res!644498 () Bool)

(assert (=> start!82622 (=> (not res!644498) (not e!543049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82622 (= res!644498 (validMask!0 mask!2110))))

(assert (=> start!82622 e!543049))

(assert (=> start!82622 true))

(declare-fun e!543050 () Bool)

(declare-fun array_inv!22063 (array!59211) Bool)

(assert (=> start!82622 (and (array_inv!22063 _values!1400) e!543050)))

(declare-fun array_inv!22064 (array!59209) Bool)

(assert (=> start!82622 (array_inv!22064 _keys!1686)))

(assert (=> start!82622 tp!65384))

(assert (=> start!82622 tp_is_empty!21557))

(declare-fun b!963035 () Bool)

(assert (=> b!963035 (= e!543049 (not true))))

(assert (=> b!963035 (contains!5423 (getCurrentListMap!3553 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28473 _keys!1686) i!803))))

(declare-datatypes ((Unit!32225 0))(
  ( (Unit!32226) )
))
(declare-fun lt!430936 () Unit!32225)

(declare-fun lemmaInListMapFromThenInFromMinusOne!7 (array!59209 array!59211 (_ BitVec 32) (_ BitVec 32) V!33725 V!33725 (_ BitVec 32) (_ BitVec 32) Int) Unit!32225)

(assert (=> b!963035 (= lt!430936 (lemmaInListMapFromThenInFromMinusOne!7 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963036 () Bool)

(declare-fun res!644499 () Bool)

(assert (=> b!963036 (=> (not res!644499) (not e!543049))))

(assert (=> b!963036 (= res!644499 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34330 () Bool)

(declare-fun mapRes!34330 () Bool)

(declare-fun tp!65385 () Bool)

(assert (=> mapNonEmpty!34330 (= mapRes!34330 (and tp!65385 e!543048))))

(declare-fun mapValue!34330 () ValueCell!10297)

(declare-fun mapKey!34330 () (_ BitVec 32))

(declare-fun mapRest!34330 () (Array (_ BitVec 32) ValueCell!10297))

(assert (=> mapNonEmpty!34330 (= (arr!28474 _values!1400) (store mapRest!34330 mapKey!34330 mapValue!34330))))

(declare-fun b!963037 () Bool)

(declare-fun res!644501 () Bool)

(assert (=> b!963037 (=> (not res!644501) (not e!543049))))

(assert (=> b!963037 (= res!644501 (and (= (size!28953 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28952 _keys!1686) (size!28953 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963038 () Bool)

(declare-fun res!644503 () Bool)

(assert (=> b!963038 (=> (not res!644503) (not e!543049))))

(declare-datatypes ((List!19763 0))(
  ( (Nil!19760) (Cons!19759 (h!20921 (_ BitVec 64)) (t!28126 List!19763)) )
))
(declare-fun arrayNoDuplicates!0 (array!59209 (_ BitVec 32) List!19763) Bool)

(assert (=> b!963038 (= res!644503 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19760))))

(declare-fun mapIsEmpty!34330 () Bool)

(assert (=> mapIsEmpty!34330 mapRes!34330))

(declare-fun b!963039 () Bool)

(declare-fun res!644497 () Bool)

(assert (=> b!963039 (=> (not res!644497) (not e!543049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963039 (= res!644497 (validKeyInArray!0 (select (arr!28473 _keys!1686) i!803)))))

(declare-fun b!963040 () Bool)

(assert (=> b!963040 (= e!543050 (and e!543046 mapRes!34330))))

(declare-fun condMapEmpty!34330 () Bool)

(declare-fun mapDefault!34330 () ValueCell!10297)

