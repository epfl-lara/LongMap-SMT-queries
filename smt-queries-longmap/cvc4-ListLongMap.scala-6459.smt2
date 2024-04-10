; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82598 () Bool)

(assert start!82598)

(declare-fun b_free!18731 () Bool)

(declare-fun b_next!18731 () Bool)

(assert (=> start!82598 (= b_free!18731 (not b_next!18731))))

(declare-fun tp!65313 () Bool)

(declare-fun b_and!30219 () Bool)

(assert (=> start!82598 (= tp!65313 b_and!30219)))

(declare-fun b!962654 () Bool)

(declare-fun e!542869 () Bool)

(declare-fun tp_is_empty!21533 () Bool)

(assert (=> b!962654 (= e!542869 tp_is_empty!21533)))

(declare-fun b!962655 () Bool)

(declare-fun res!644232 () Bool)

(declare-fun e!542866 () Bool)

(assert (=> b!962655 (=> (not res!644232) (not e!542866))))

(declare-datatypes ((array!59163 0))(
  ( (array!59164 (arr!28450 (Array (_ BitVec 32) (_ BitVec 64))) (size!28929 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59163)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962655 (= res!644232 (validKeyInArray!0 (select (arr!28450 _keys!1686) i!803)))))

(declare-fun b!962656 () Bool)

(declare-fun e!542870 () Bool)

(assert (=> b!962656 (= e!542870 tp_is_empty!21533)))

(declare-fun b!962657 () Bool)

(assert (=> b!962657 (= e!542866 false)))

(declare-datatypes ((V!33693 0))(
  ( (V!33694 (val!10817 Int)) )
))
(declare-datatypes ((ValueCell!10285 0))(
  ( (ValueCellFull!10285 (v!13375 V!33693)) (EmptyCell!10285) )
))
(declare-datatypes ((array!59165 0))(
  ( (array!59166 (arr!28451 (Array (_ BitVec 32) ValueCell!10285)) (size!28930 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59165)

(declare-fun minValue!1342 () V!33693)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430900 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33693)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13894 0))(
  ( (tuple2!13895 (_1!6958 (_ BitVec 64)) (_2!6958 V!33693)) )
))
(declare-datatypes ((List!19744 0))(
  ( (Nil!19741) (Cons!19740 (h!20902 tuple2!13894) (t!28107 List!19744)) )
))
(declare-datatypes ((ListLongMap!12591 0))(
  ( (ListLongMap!12592 (toList!6311 List!19744)) )
))
(declare-fun contains!5414 (ListLongMap!12591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3544 (array!59163 array!59165 (_ BitVec 32) (_ BitVec 32) V!33693 V!33693 (_ BitVec 32) Int) ListLongMap!12591)

(assert (=> b!962657 (= lt!430900 (contains!5414 (getCurrentListMap!3544 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28450 _keys!1686) i!803)))))

(declare-fun b!962658 () Bool)

(declare-fun res!644228 () Bool)

(assert (=> b!962658 (=> (not res!644228) (not e!542866))))

(declare-datatypes ((List!19745 0))(
  ( (Nil!19742) (Cons!19741 (h!20903 (_ BitVec 64)) (t!28108 List!19745)) )
))
(declare-fun arrayNoDuplicates!0 (array!59163 (_ BitVec 32) List!19745) Bool)

(assert (=> b!962658 (= res!644228 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19742))))

(declare-fun b!962659 () Bool)

(declare-fun e!542867 () Bool)

(declare-fun mapRes!34294 () Bool)

(assert (=> b!962659 (= e!542867 (and e!542870 mapRes!34294))))

(declare-fun condMapEmpty!34294 () Bool)

(declare-fun mapDefault!34294 () ValueCell!10285)

