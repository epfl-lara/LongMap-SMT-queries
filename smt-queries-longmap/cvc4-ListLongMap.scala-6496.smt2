; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82820 () Bool)

(assert start!82820)

(declare-fun b_free!18947 () Bool)

(declare-fun b_next!18947 () Bool)

(assert (=> start!82820 (= b_free!18947 (not b_next!18947))))

(declare-fun tp!65969 () Bool)

(declare-fun b_and!30435 () Bool)

(assert (=> start!82820 (= tp!65969 b_and!30435)))

(declare-fun b!966101 () Bool)

(declare-fun res!646678 () Bool)

(declare-fun e!544613 () Bool)

(assert (=> b!966101 (=> (not res!646678) (not e!544613))))

(declare-datatypes ((array!59595 0))(
  ( (array!59596 (arr!28666 (Array (_ BitVec 32) (_ BitVec 64))) (size!29145 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59595)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59595 (_ BitVec 32)) Bool)

(assert (=> b!966101 (= res!646678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966102 () Bool)

(declare-fun res!646677 () Bool)

(assert (=> b!966102 (=> (not res!646677) (not e!544613))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33989 0))(
  ( (V!33990 (val!10928 Int)) )
))
(declare-datatypes ((ValueCell!10396 0))(
  ( (ValueCellFull!10396 (v!13486 V!33989)) (EmptyCell!10396) )
))
(declare-datatypes ((array!59597 0))(
  ( (array!59598 (arr!28667 (Array (_ BitVec 32) ValueCell!10396)) (size!29146 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59597)

(assert (=> b!966102 (= res!646677 (and (= (size!29146 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29145 _keys!1686) (size!29146 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966103 () Bool)

(declare-fun e!544612 () Bool)

(declare-fun tp_is_empty!21755 () Bool)

(assert (=> b!966103 (= e!544612 tp_is_empty!21755)))

(declare-fun b!966104 () Bool)

(declare-fun res!646679 () Bool)

(assert (=> b!966104 (=> (not res!646679) (not e!544613))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966104 (= res!646679 (validKeyInArray!0 (select (arr!28666 _keys!1686) i!803)))))

(declare-fun b!966105 () Bool)

(declare-fun res!646681 () Bool)

(assert (=> b!966105 (=> (not res!646681) (not e!544613))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966105 (= res!646681 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29145 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29145 _keys!1686))))))

(declare-fun mapNonEmpty!34627 () Bool)

(declare-fun mapRes!34627 () Bool)

(declare-fun tp!65970 () Bool)

(assert (=> mapNonEmpty!34627 (= mapRes!34627 (and tp!65970 e!544612))))

(declare-fun mapKey!34627 () (_ BitVec 32))

(declare-fun mapRest!34627 () (Array (_ BitVec 32) ValueCell!10396))

(declare-fun mapValue!34627 () ValueCell!10396)

(assert (=> mapNonEmpty!34627 (= (arr!28667 _values!1400) (store mapRest!34627 mapKey!34627 mapValue!34627))))

(declare-fun b!966106 () Bool)

(assert (=> b!966106 (= e!544613 false)))

(declare-fun minValue!1342 () V!33989)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431296 () Bool)

(declare-fun zeroValue!1342 () V!33989)

(declare-datatypes ((tuple2!14054 0))(
  ( (tuple2!14055 (_1!7038 (_ BitVec 64)) (_2!7038 V!33989)) )
))
(declare-datatypes ((List!19895 0))(
  ( (Nil!19892) (Cons!19891 (h!21053 tuple2!14054) (t!28258 List!19895)) )
))
(declare-datatypes ((ListLongMap!12751 0))(
  ( (ListLongMap!12752 (toList!6391 List!19895)) )
))
(declare-fun contains!5492 (ListLongMap!12751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3624 (array!59595 array!59597 (_ BitVec 32) (_ BitVec 32) V!33989 V!33989 (_ BitVec 32) Int) ListLongMap!12751)

(assert (=> b!966106 (= lt!431296 (contains!5492 (getCurrentListMap!3624 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28666 _keys!1686) i!803)))))

(declare-fun b!966107 () Bool)

(declare-fun res!646676 () Bool)

(assert (=> b!966107 (=> (not res!646676) (not e!544613))))

(declare-datatypes ((List!19896 0))(
  ( (Nil!19893) (Cons!19892 (h!21054 (_ BitVec 64)) (t!28259 List!19896)) )
))
(declare-fun arrayNoDuplicates!0 (array!59595 (_ BitVec 32) List!19896) Bool)

(assert (=> b!966107 (= res!646676 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19893))))

(declare-fun b!966108 () Bool)

(declare-fun e!544615 () Bool)

(declare-fun e!544616 () Bool)

(assert (=> b!966108 (= e!544615 (and e!544616 mapRes!34627))))

(declare-fun condMapEmpty!34627 () Bool)

(declare-fun mapDefault!34627 () ValueCell!10396)

