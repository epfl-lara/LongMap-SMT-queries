; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82594 () Bool)

(assert start!82594)

(declare-fun b_free!18727 () Bool)

(declare-fun b_next!18727 () Bool)

(assert (=> start!82594 (= b_free!18727 (not b_next!18727))))

(declare-fun tp!65300 () Bool)

(declare-fun b_and!30215 () Bool)

(assert (=> start!82594 (= tp!65300 b_and!30215)))

(declare-fun b!962600 () Bool)

(declare-fun e!542837 () Bool)

(declare-fun tp_is_empty!21529 () Bool)

(assert (=> b!962600 (= e!542837 tp_is_empty!21529)))

(declare-fun b!962601 () Bool)

(declare-fun res!644197 () Bool)

(declare-fun e!542840 () Bool)

(assert (=> b!962601 (=> (not res!644197) (not e!542840))))

(declare-datatypes ((array!59155 0))(
  ( (array!59156 (arr!28446 (Array (_ BitVec 32) (_ BitVec 64))) (size!28925 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59155)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962601 (= res!644197 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28925 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28925 _keys!1686))))))

(declare-fun b!962602 () Bool)

(declare-fun e!542839 () Bool)

(assert (=> b!962602 (= e!542839 tp_is_empty!21529)))

(declare-fun mapIsEmpty!34288 () Bool)

(declare-fun mapRes!34288 () Bool)

(assert (=> mapIsEmpty!34288 mapRes!34288))

(declare-fun res!644194 () Bool)

(assert (=> start!82594 (=> (not res!644194) (not e!542840))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82594 (= res!644194 (validMask!0 mask!2110))))

(assert (=> start!82594 e!542840))

(assert (=> start!82594 true))

(declare-datatypes ((V!33689 0))(
  ( (V!33690 (val!10815 Int)) )
))
(declare-datatypes ((ValueCell!10283 0))(
  ( (ValueCellFull!10283 (v!13373 V!33689)) (EmptyCell!10283) )
))
(declare-datatypes ((array!59157 0))(
  ( (array!59158 (arr!28447 (Array (_ BitVec 32) ValueCell!10283)) (size!28926 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59157)

(declare-fun e!542836 () Bool)

(declare-fun array_inv!22041 (array!59157) Bool)

(assert (=> start!82594 (and (array_inv!22041 _values!1400) e!542836)))

(declare-fun array_inv!22042 (array!59155) Bool)

(assert (=> start!82594 (array_inv!22042 _keys!1686)))

(assert (=> start!82594 tp!65300))

(assert (=> start!82594 tp_is_empty!21529))

(declare-fun b!962603 () Bool)

(assert (=> b!962603 (= e!542840 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33689)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430894 () Bool)

(declare-fun zeroValue!1342 () V!33689)

(declare-datatypes ((tuple2!13890 0))(
  ( (tuple2!13891 (_1!6956 (_ BitVec 64)) (_2!6956 V!33689)) )
))
(declare-datatypes ((List!19741 0))(
  ( (Nil!19738) (Cons!19737 (h!20899 tuple2!13890) (t!28104 List!19741)) )
))
(declare-datatypes ((ListLongMap!12587 0))(
  ( (ListLongMap!12588 (toList!6309 List!19741)) )
))
(declare-fun contains!5412 (ListLongMap!12587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3542 (array!59155 array!59157 (_ BitVec 32) (_ BitVec 32) V!33689 V!33689 (_ BitVec 32) Int) ListLongMap!12587)

(assert (=> b!962603 (= lt!430894 (contains!5412 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28446 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34288 () Bool)

(declare-fun tp!65301 () Bool)

(assert (=> mapNonEmpty!34288 (= mapRes!34288 (and tp!65301 e!542839))))

(declare-fun mapKey!34288 () (_ BitVec 32))

(declare-fun mapValue!34288 () ValueCell!10283)

(declare-fun mapRest!34288 () (Array (_ BitVec 32) ValueCell!10283))

(assert (=> mapNonEmpty!34288 (= (arr!28447 _values!1400) (store mapRest!34288 mapKey!34288 mapValue!34288))))

(declare-fun b!962604 () Bool)

(declare-fun res!644195 () Bool)

(assert (=> b!962604 (=> (not res!644195) (not e!542840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59155 (_ BitVec 32)) Bool)

(assert (=> b!962604 (= res!644195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962605 () Bool)

(declare-fun res!644192 () Bool)

(assert (=> b!962605 (=> (not res!644192) (not e!542840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962605 (= res!644192 (validKeyInArray!0 (select (arr!28446 _keys!1686) i!803)))))

(declare-fun b!962606 () Bool)

(declare-fun res!644193 () Bool)

(assert (=> b!962606 (=> (not res!644193) (not e!542840))))

(assert (=> b!962606 (= res!644193 (and (= (size!28926 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28925 _keys!1686) (size!28926 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962607 () Bool)

(assert (=> b!962607 (= e!542836 (and e!542837 mapRes!34288))))

(declare-fun condMapEmpty!34288 () Bool)

(declare-fun mapDefault!34288 () ValueCell!10283)

