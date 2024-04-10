; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82898 () Bool)

(assert start!82898)

(declare-fun b_free!19025 () Bool)

(declare-fun b_next!19025 () Bool)

(assert (=> start!82898 (= b_free!19025 (not b_next!19025))))

(declare-fun tp!66204 () Bool)

(declare-fun b_and!30513 () Bool)

(assert (=> start!82898 (= tp!66204 b_and!30513)))

(declare-fun b!967251 () Bool)

(declare-fun res!647480 () Bool)

(declare-fun e!545199 () Bool)

(assert (=> b!967251 (=> (not res!647480) (not e!545199))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967251 (= res!647480 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967252 () Bool)

(declare-fun res!647478 () Bool)

(assert (=> b!967252 (=> (not res!647478) (not e!545199))))

(declare-datatypes ((array!59741 0))(
  ( (array!59742 (arr!28739 (Array (_ BitVec 32) (_ BitVec 64))) (size!29218 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59741)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967252 (= res!647478 (validKeyInArray!0 (select (arr!28739 _keys!1686) i!803)))))

(declare-fun res!647477 () Bool)

(assert (=> start!82898 (=> (not res!647477) (not e!545199))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82898 (= res!647477 (validMask!0 mask!2110))))

(assert (=> start!82898 e!545199))

(assert (=> start!82898 true))

(declare-datatypes ((V!34093 0))(
  ( (V!34094 (val!10967 Int)) )
))
(declare-datatypes ((ValueCell!10435 0))(
  ( (ValueCellFull!10435 (v!13525 V!34093)) (EmptyCell!10435) )
))
(declare-datatypes ((array!59743 0))(
  ( (array!59744 (arr!28740 (Array (_ BitVec 32) ValueCell!10435)) (size!29219 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59743)

(declare-fun e!545200 () Bool)

(declare-fun array_inv!22255 (array!59743) Bool)

(assert (=> start!82898 (and (array_inv!22255 _values!1400) e!545200)))

(declare-fun array_inv!22256 (array!59741) Bool)

(assert (=> start!82898 (array_inv!22256 _keys!1686)))

(assert (=> start!82898 tp!66204))

(declare-fun tp_is_empty!21833 () Bool)

(assert (=> start!82898 tp_is_empty!21833))

(declare-fun b!967253 () Bool)

(declare-fun res!647482 () Bool)

(assert (=> b!967253 (=> (not res!647482) (not e!545199))))

(declare-datatypes ((List!19952 0))(
  ( (Nil!19949) (Cons!19948 (h!21110 (_ BitVec 64)) (t!28315 List!19952)) )
))
(declare-fun arrayNoDuplicates!0 (array!59741 (_ BitVec 32) List!19952) Bool)

(assert (=> b!967253 (= res!647482 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19949))))

(declare-fun b!967254 () Bool)

(declare-fun res!647476 () Bool)

(assert (=> b!967254 (=> (not res!647476) (not e!545199))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967254 (= res!647476 (and (= (size!29219 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29218 _keys!1686) (size!29219 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967255 () Bool)

(declare-fun e!545197 () Bool)

(assert (=> b!967255 (= e!545197 tp_is_empty!21833)))

(declare-fun b!967256 () Bool)

(declare-fun res!647479 () Bool)

(assert (=> b!967256 (=> (not res!647479) (not e!545199))))

(declare-fun minValue!1342 () V!34093)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34093)

(declare-datatypes ((tuple2!14102 0))(
  ( (tuple2!14103 (_1!7062 (_ BitVec 64)) (_2!7062 V!34093)) )
))
(declare-datatypes ((List!19953 0))(
  ( (Nil!19950) (Cons!19949 (h!21111 tuple2!14102) (t!28316 List!19953)) )
))
(declare-datatypes ((ListLongMap!12799 0))(
  ( (ListLongMap!12800 (toList!6415 List!19953)) )
))
(declare-fun contains!5516 (ListLongMap!12799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3648 (array!59741 array!59743 (_ BitVec 32) (_ BitVec 32) V!34093 V!34093 (_ BitVec 32) Int) ListLongMap!12799)

(assert (=> b!967256 (= res!647479 (contains!5516 (getCurrentListMap!3648 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28739 _keys!1686) i!803)))))

(declare-fun b!967257 () Bool)

(declare-fun e!545198 () Bool)

(assert (=> b!967257 (= e!545198 tp_is_empty!21833)))

(declare-fun b!967258 () Bool)

(declare-fun res!647481 () Bool)

(assert (=> b!967258 (=> (not res!647481) (not e!545199))))

(assert (=> b!967258 (= res!647481 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29218 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29218 _keys!1686))))))

(declare-fun mapNonEmpty!34744 () Bool)

(declare-fun mapRes!34744 () Bool)

(declare-fun tp!66203 () Bool)

(assert (=> mapNonEmpty!34744 (= mapRes!34744 (and tp!66203 e!545197))))

(declare-fun mapRest!34744 () (Array (_ BitVec 32) ValueCell!10435))

(declare-fun mapValue!34744 () ValueCell!10435)

(declare-fun mapKey!34744 () (_ BitVec 32))

(assert (=> mapNonEmpty!34744 (= (arr!28740 _values!1400) (store mapRest!34744 mapKey!34744 mapValue!34744))))

(declare-fun mapIsEmpty!34744 () Bool)

(assert (=> mapIsEmpty!34744 mapRes!34744))

(declare-fun b!967259 () Bool)

(assert (=> b!967259 (= e!545200 (and e!545198 mapRes!34744))))

(declare-fun condMapEmpty!34744 () Bool)

(declare-fun mapDefault!34744 () ValueCell!10435)

