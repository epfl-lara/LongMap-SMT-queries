; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82718 () Bool)

(assert start!82718)

(declare-fun b_free!18851 () Bool)

(declare-fun b_next!18851 () Bool)

(assert (=> start!82718 (= b_free!18851 (not b_next!18851))))

(declare-fun tp!65672 () Bool)

(declare-fun b_and!30339 () Bool)

(assert (=> start!82718 (= tp!65672 b_and!30339)))

(declare-fun b!964676 () Bool)

(declare-fun res!645712 () Bool)

(declare-fun e!543830 () Bool)

(assert (=> b!964676 (=> (not res!645712) (not e!543830))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33853 0))(
  ( (V!33854 (val!10877 Int)) )
))
(declare-datatypes ((ValueCell!10345 0))(
  ( (ValueCellFull!10345 (v!13435 V!33853)) (EmptyCell!10345) )
))
(declare-datatypes ((array!59393 0))(
  ( (array!59394 (arr!28565 (Array (_ BitVec 32) ValueCell!10345)) (size!29044 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59393)

(declare-datatypes ((array!59395 0))(
  ( (array!59396 (arr!28566 (Array (_ BitVec 32) (_ BitVec 64))) (size!29045 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59395)

(declare-fun minValue!1342 () V!33853)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33853)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13980 0))(
  ( (tuple2!13981 (_1!7001 (_ BitVec 64)) (_2!7001 V!33853)) )
))
(declare-datatypes ((List!19825 0))(
  ( (Nil!19822) (Cons!19821 (h!20983 tuple2!13980) (t!28188 List!19825)) )
))
(declare-datatypes ((ListLongMap!12677 0))(
  ( (ListLongMap!12678 (toList!6354 List!19825)) )
))
(declare-fun contains!5457 (ListLongMap!12677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3587 (array!59395 array!59393 (_ BitVec 32) (_ BitVec 32) V!33853 V!33853 (_ BitVec 32) Int) ListLongMap!12677)

(assert (=> b!964676 (= res!645712 (contains!5457 (getCurrentListMap!3587 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28566 _keys!1686) i!803)))))

(declare-fun b!964677 () Bool)

(declare-fun e!543828 () Bool)

(assert (=> b!964677 (= e!543830 (not e!543828))))

(declare-fun res!645716 () Bool)

(assert (=> b!964677 (=> res!645716 e!543828)))

(assert (=> b!964677 (= res!645716 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29045 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964677 (contains!5457 (getCurrentListMap!3587 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28566 _keys!1686) i!803))))

(declare-datatypes ((Unit!32289 0))(
  ( (Unit!32290) )
))
(declare-fun lt!431142 () Unit!32289)

(declare-fun lemmaInListMapFromThenInFromMinusOne!39 (array!59395 array!59393 (_ BitVec 32) (_ BitVec 32) V!33853 V!33853 (_ BitVec 32) (_ BitVec 32) Int) Unit!32289)

(assert (=> b!964677 (= lt!431142 (lemmaInListMapFromThenInFromMinusOne!39 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964678 () Bool)

(declare-fun res!645713 () Bool)

(assert (=> b!964678 (=> (not res!645713) (not e!543830))))

(declare-datatypes ((List!19826 0))(
  ( (Nil!19823) (Cons!19822 (h!20984 (_ BitVec 64)) (t!28189 List!19826)) )
))
(declare-fun arrayNoDuplicates!0 (array!59395 (_ BitVec 32) List!19826) Bool)

(assert (=> b!964678 (= res!645713 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19823))))

(declare-fun b!964679 () Bool)

(declare-fun res!645710 () Bool)

(assert (=> b!964679 (=> (not res!645710) (not e!543830))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964679 (= res!645710 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964680 () Bool)

(declare-fun e!543833 () Bool)

(declare-fun tp_is_empty!21653 () Bool)

(assert (=> b!964680 (= e!543833 tp_is_empty!21653)))

(declare-fun b!964681 () Bool)

(declare-fun e!543832 () Bool)

(assert (=> b!964681 (= e!543832 tp_is_empty!21653)))

(declare-fun b!964682 () Bool)

(declare-fun e!543831 () Bool)

(declare-fun mapRes!34474 () Bool)

(assert (=> b!964682 (= e!543831 (and e!543833 mapRes!34474))))

(declare-fun condMapEmpty!34474 () Bool)

(declare-fun mapDefault!34474 () ValueCell!10345)

