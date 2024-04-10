; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82838 () Bool)

(assert start!82838)

(declare-fun b_free!18965 () Bool)

(declare-fun b_next!18965 () Bool)

(assert (=> start!82838 (= b_free!18965 (not b_next!18965))))

(declare-fun tp!66023 () Bool)

(declare-fun b_and!30453 () Bool)

(assert (=> start!82838 (= tp!66023 b_and!30453)))

(declare-fun b!966344 () Bool)

(declare-fun res!646843 () Bool)

(declare-fun e!544750 () Bool)

(assert (=> b!966344 (=> (not res!646843) (not e!544750))))

(declare-datatypes ((array!59631 0))(
  ( (array!59632 (arr!28684 (Array (_ BitVec 32) (_ BitVec 64))) (size!29163 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59631)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966344 (= res!646843 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29163 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29163 _keys!1686))))))

(declare-fun b!966345 () Bool)

(declare-fun res!646838 () Bool)

(assert (=> b!966345 (=> (not res!646838) (not e!544750))))

(declare-datatypes ((List!19911 0))(
  ( (Nil!19908) (Cons!19907 (h!21069 (_ BitVec 64)) (t!28274 List!19911)) )
))
(declare-fun arrayNoDuplicates!0 (array!59631 (_ BitVec 32) List!19911) Bool)

(assert (=> b!966345 (= res!646838 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19908))))

(declare-fun b!966346 () Bool)

(declare-fun res!646840 () Bool)

(assert (=> b!966346 (=> (not res!646840) (not e!544750))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34013 0))(
  ( (V!34014 (val!10937 Int)) )
))
(declare-datatypes ((ValueCell!10405 0))(
  ( (ValueCellFull!10405 (v!13495 V!34013)) (EmptyCell!10405) )
))
(declare-datatypes ((array!59633 0))(
  ( (array!59634 (arr!28685 (Array (_ BitVec 32) ValueCell!10405)) (size!29164 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59633)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966346 (= res!646840 (and (= (size!29164 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29163 _keys!1686) (size!29164 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966347 () Bool)

(declare-fun res!646841 () Bool)

(assert (=> b!966347 (=> (not res!646841) (not e!544750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966347 (= res!646841 (validKeyInArray!0 (select (arr!28684 _keys!1686) i!803)))))

(declare-fun b!966348 () Bool)

(declare-fun res!646842 () Bool)

(assert (=> b!966348 (=> (not res!646842) (not e!544750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59631 (_ BitVec 32)) Bool)

(assert (=> b!966348 (= res!646842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34654 () Bool)

(declare-fun mapRes!34654 () Bool)

(assert (=> mapIsEmpty!34654 mapRes!34654))

(declare-fun b!966349 () Bool)

(assert (=> b!966349 (= e!544750 false)))

(declare-fun minValue!1342 () V!34013)

(declare-fun zeroValue!1342 () V!34013)

(declare-fun lt!431323 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14068 0))(
  ( (tuple2!14069 (_1!7045 (_ BitVec 64)) (_2!7045 V!34013)) )
))
(declare-datatypes ((List!19912 0))(
  ( (Nil!19909) (Cons!19908 (h!21070 tuple2!14068) (t!28275 List!19912)) )
))
(declare-datatypes ((ListLongMap!12765 0))(
  ( (ListLongMap!12766 (toList!6398 List!19912)) )
))
(declare-fun contains!5499 (ListLongMap!12765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3631 (array!59631 array!59633 (_ BitVec 32) (_ BitVec 32) V!34013 V!34013 (_ BitVec 32) Int) ListLongMap!12765)

(assert (=> b!966349 (= lt!431323 (contains!5499 (getCurrentListMap!3631 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28684 _keys!1686) i!803)))))

(declare-fun b!966350 () Bool)

(declare-fun e!544747 () Bool)

(declare-fun tp_is_empty!21773 () Bool)

(assert (=> b!966350 (= e!544747 tp_is_empty!21773)))

(declare-fun res!646839 () Bool)

(assert (=> start!82838 (=> (not res!646839) (not e!544750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82838 (= res!646839 (validMask!0 mask!2110))))

(assert (=> start!82838 e!544750))

(assert (=> start!82838 true))

(declare-fun e!544749 () Bool)

(declare-fun array_inv!22217 (array!59633) Bool)

(assert (=> start!82838 (and (array_inv!22217 _values!1400) e!544749)))

(declare-fun array_inv!22218 (array!59631) Bool)

(assert (=> start!82838 (array_inv!22218 _keys!1686)))

(assert (=> start!82838 tp!66023))

(assert (=> start!82838 tp_is_empty!21773))

(declare-fun mapNonEmpty!34654 () Bool)

(declare-fun tp!66024 () Bool)

(declare-fun e!544751 () Bool)

(assert (=> mapNonEmpty!34654 (= mapRes!34654 (and tp!66024 e!544751))))

(declare-fun mapRest!34654 () (Array (_ BitVec 32) ValueCell!10405))

(declare-fun mapValue!34654 () ValueCell!10405)

(declare-fun mapKey!34654 () (_ BitVec 32))

(assert (=> mapNonEmpty!34654 (= (arr!28685 _values!1400) (store mapRest!34654 mapKey!34654 mapValue!34654))))

(declare-fun b!966351 () Bool)

(assert (=> b!966351 (= e!544749 (and e!544747 mapRes!34654))))

(declare-fun condMapEmpty!34654 () Bool)

(declare-fun mapDefault!34654 () ValueCell!10405)

