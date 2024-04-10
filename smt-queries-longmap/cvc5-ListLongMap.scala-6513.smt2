; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82918 () Bool)

(assert start!82918)

(declare-fun b_free!19045 () Bool)

(declare-fun b_next!19045 () Bool)

(assert (=> start!82918 (= b_free!19045 (not b_next!19045))))

(declare-fun tp!66264 () Bool)

(declare-fun b_and!30533 () Bool)

(assert (=> start!82918 (= tp!66264 b_and!30533)))

(declare-fun mapIsEmpty!34774 () Bool)

(declare-fun mapRes!34774 () Bool)

(assert (=> mapIsEmpty!34774 mapRes!34774))

(declare-fun b!967581 () Bool)

(declare-fun res!647717 () Bool)

(declare-fun e!545347 () Bool)

(assert (=> b!967581 (=> (not res!647717) (not e!545347))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34121 0))(
  ( (V!34122 (val!10977 Int)) )
))
(declare-datatypes ((ValueCell!10445 0))(
  ( (ValueCellFull!10445 (v!13535 V!34121)) (EmptyCell!10445) )
))
(declare-datatypes ((array!59779 0))(
  ( (array!59780 (arr!28758 (Array (_ BitVec 32) ValueCell!10445)) (size!29237 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59779)

(declare-datatypes ((array!59781 0))(
  ( (array!59782 (arr!28759 (Array (_ BitVec 32) (_ BitVec 64))) (size!29238 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59781)

(declare-fun minValue!1342 () V!34121)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34121)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14118 0))(
  ( (tuple2!14119 (_1!7070 (_ BitVec 64)) (_2!7070 V!34121)) )
))
(declare-datatypes ((List!19967 0))(
  ( (Nil!19964) (Cons!19963 (h!21125 tuple2!14118) (t!28330 List!19967)) )
))
(declare-datatypes ((ListLongMap!12815 0))(
  ( (ListLongMap!12816 (toList!6423 List!19967)) )
))
(declare-fun contains!5524 (ListLongMap!12815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3656 (array!59781 array!59779 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) Int) ListLongMap!12815)

(assert (=> b!967581 (= res!647717 (contains!5524 (getCurrentListMap!3656 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28759 _keys!1686) i!803)))))

(declare-fun b!967582 () Bool)

(declare-fun e!545350 () Bool)

(declare-fun tp_is_empty!21853 () Bool)

(assert (=> b!967582 (= e!545350 tp_is_empty!21853)))

(declare-fun b!967583 () Bool)

(declare-fun res!647715 () Bool)

(assert (=> b!967583 (=> (not res!647715) (not e!545347))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967583 (= res!647715 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29238 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29238 _keys!1686))))))

(declare-fun b!967584 () Bool)

(assert (=> b!967584 (= e!545347 (not (and (bvsge (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2084 #b00000000000000000000000000000001) (size!29238 _keys!1686)))))))

(assert (=> b!967584 (contains!5524 (getCurrentListMap!3656 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28759 _keys!1686) i!803))))

(declare-datatypes ((Unit!32329 0))(
  ( (Unit!32330) )
))
(declare-fun lt!431434 () Unit!32329)

(declare-fun lemmaInListMapFromThenInFromMinusOne!59 (array!59781 array!59779 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) (_ BitVec 32) Int) Unit!32329)

(assert (=> b!967584 (= lt!431434 (lemmaInListMapFromThenInFromMinusOne!59 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967585 () Bool)

(declare-fun res!647718 () Bool)

(assert (=> b!967585 (=> (not res!647718) (not e!545347))))

(assert (=> b!967585 (= res!647718 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967586 () Bool)

(declare-fun res!647721 () Bool)

(assert (=> b!967586 (=> (not res!647721) (not e!545347))))

(assert (=> b!967586 (= res!647721 (and (= (size!29237 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29238 _keys!1686) (size!29237 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967587 () Bool)

(declare-fun res!647719 () Bool)

(assert (=> b!967587 (=> (not res!647719) (not e!545347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967587 (= res!647719 (validKeyInArray!0 (select (arr!28759 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34774 () Bool)

(declare-fun tp!66263 () Bool)

(declare-fun e!545348 () Bool)

(assert (=> mapNonEmpty!34774 (= mapRes!34774 (and tp!66263 e!545348))))

(declare-fun mapRest!34774 () (Array (_ BitVec 32) ValueCell!10445))

(declare-fun mapValue!34774 () ValueCell!10445)

(declare-fun mapKey!34774 () (_ BitVec 32))

(assert (=> mapNonEmpty!34774 (= (arr!28758 _values!1400) (store mapRest!34774 mapKey!34774 mapValue!34774))))

(declare-fun b!967588 () Bool)

(declare-fun e!545351 () Bool)

(assert (=> b!967588 (= e!545351 (and e!545350 mapRes!34774))))

(declare-fun condMapEmpty!34774 () Bool)

(declare-fun mapDefault!34774 () ValueCell!10445)

