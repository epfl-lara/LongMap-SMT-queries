; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82834 () Bool)

(assert start!82834)

(declare-fun b_free!18961 () Bool)

(declare-fun b_next!18961 () Bool)

(assert (=> start!82834 (= b_free!18961 (not b_next!18961))))

(declare-fun tp!66012 () Bool)

(declare-fun b_and!30449 () Bool)

(assert (=> start!82834 (= tp!66012 b_and!30449)))

(declare-fun b!966290 () Bool)

(declare-fun res!646807 () Bool)

(declare-fun e!544718 () Bool)

(assert (=> b!966290 (=> (not res!646807) (not e!544718))))

(declare-datatypes ((array!59623 0))(
  ( (array!59624 (arr!28680 (Array (_ BitVec 32) (_ BitVec 64))) (size!29159 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59623)

(declare-datatypes ((List!19907 0))(
  ( (Nil!19904) (Cons!19903 (h!21065 (_ BitVec 64)) (t!28270 List!19907)) )
))
(declare-fun arrayNoDuplicates!0 (array!59623 (_ BitVec 32) List!19907) Bool)

(assert (=> b!966290 (= res!646807 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19904))))

(declare-fun res!646804 () Bool)

(assert (=> start!82834 (=> (not res!646804) (not e!544718))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82834 (= res!646804 (validMask!0 mask!2110))))

(assert (=> start!82834 e!544718))

(assert (=> start!82834 true))

(declare-datatypes ((V!34009 0))(
  ( (V!34010 (val!10935 Int)) )
))
(declare-datatypes ((ValueCell!10403 0))(
  ( (ValueCellFull!10403 (v!13493 V!34009)) (EmptyCell!10403) )
))
(declare-datatypes ((array!59625 0))(
  ( (array!59626 (arr!28681 (Array (_ BitVec 32) ValueCell!10403)) (size!29160 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59625)

(declare-fun e!544720 () Bool)

(declare-fun array_inv!22213 (array!59625) Bool)

(assert (=> start!82834 (and (array_inv!22213 _values!1400) e!544720)))

(declare-fun array_inv!22214 (array!59623) Bool)

(assert (=> start!82834 (array_inv!22214 _keys!1686)))

(assert (=> start!82834 tp!66012))

(declare-fun tp_is_empty!21769 () Bool)

(assert (=> start!82834 tp_is_empty!21769))

(declare-fun b!966291 () Bool)

(declare-fun res!646802 () Bool)

(assert (=> b!966291 (=> (not res!646802) (not e!544718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59623 (_ BitVec 32)) Bool)

(assert (=> b!966291 (= res!646802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966292 () Bool)

(declare-fun res!646803 () Bool)

(assert (=> b!966292 (=> (not res!646803) (not e!544718))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966292 (= res!646803 (validKeyInArray!0 (select (arr!28680 _keys!1686) i!803)))))

(declare-fun b!966293 () Bool)

(declare-fun e!544719 () Bool)

(assert (=> b!966293 (= e!544719 tp_is_empty!21769)))

(declare-fun mapNonEmpty!34648 () Bool)

(declare-fun mapRes!34648 () Bool)

(declare-fun tp!66011 () Bool)

(assert (=> mapNonEmpty!34648 (= mapRes!34648 (and tp!66011 e!544719))))

(declare-fun mapKey!34648 () (_ BitVec 32))

(declare-fun mapValue!34648 () ValueCell!10403)

(declare-fun mapRest!34648 () (Array (_ BitVec 32) ValueCell!10403))

(assert (=> mapNonEmpty!34648 (= (arr!28681 _values!1400) (store mapRest!34648 mapKey!34648 mapValue!34648))))

(declare-fun b!966294 () Bool)

(declare-fun res!646806 () Bool)

(assert (=> b!966294 (=> (not res!646806) (not e!544718))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966294 (= res!646806 (and (= (size!29160 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29159 _keys!1686) (size!29160 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34648 () Bool)

(assert (=> mapIsEmpty!34648 mapRes!34648))

(declare-fun b!966295 () Bool)

(assert (=> b!966295 (= e!544718 false)))

(declare-fun minValue!1342 () V!34009)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431317 () Bool)

(declare-fun zeroValue!1342 () V!34009)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14064 0))(
  ( (tuple2!14065 (_1!7043 (_ BitVec 64)) (_2!7043 V!34009)) )
))
(declare-datatypes ((List!19908 0))(
  ( (Nil!19905) (Cons!19904 (h!21066 tuple2!14064) (t!28271 List!19908)) )
))
(declare-datatypes ((ListLongMap!12761 0))(
  ( (ListLongMap!12762 (toList!6396 List!19908)) )
))
(declare-fun contains!5497 (ListLongMap!12761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3629 (array!59623 array!59625 (_ BitVec 32) (_ BitVec 32) V!34009 V!34009 (_ BitVec 32) Int) ListLongMap!12761)

(assert (=> b!966295 (= lt!431317 (contains!5497 (getCurrentListMap!3629 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28680 _keys!1686) i!803)))))

(declare-fun b!966296 () Bool)

(declare-fun res!646805 () Bool)

(assert (=> b!966296 (=> (not res!646805) (not e!544718))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966296 (= res!646805 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29159 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29159 _keys!1686))))))

(declare-fun b!966297 () Bool)

(declare-fun e!544717 () Bool)

(assert (=> b!966297 (= e!544720 (and e!544717 mapRes!34648))))

(declare-fun condMapEmpty!34648 () Bool)

(declare-fun mapDefault!34648 () ValueCell!10403)

