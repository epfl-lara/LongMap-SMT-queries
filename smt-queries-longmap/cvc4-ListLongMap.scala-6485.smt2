; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82754 () Bool)

(assert start!82754)

(declare-fun b_free!18887 () Bool)

(declare-fun b_next!18887 () Bool)

(assert (=> start!82754 (= b_free!18887 (not b_next!18887))))

(declare-fun tp!65781 () Bool)

(declare-fun b_and!30375 () Bool)

(assert (=> start!82754 (= tp!65781 b_and!30375)))

(declare-fun b!965219 () Bool)

(declare-fun res!646091 () Bool)

(declare-fun e!544121 () Bool)

(assert (=> b!965219 (=> (not res!646091) (not e!544121))))

(declare-datatypes ((array!59463 0))(
  ( (array!59464 (arr!28600 (Array (_ BitVec 32) (_ BitVec 64))) (size!29079 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59463)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965219 (= res!646091 (validKeyInArray!0 (select (arr!28600 _keys!1686) i!803)))))

(declare-fun b!965220 () Bool)

(declare-fun res!646092 () Bool)

(assert (=> b!965220 (=> (not res!646092) (not e!544121))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33901 0))(
  ( (V!33902 (val!10895 Int)) )
))
(declare-datatypes ((ValueCell!10363 0))(
  ( (ValueCellFull!10363 (v!13453 V!33901)) (EmptyCell!10363) )
))
(declare-datatypes ((array!59465 0))(
  ( (array!59466 (arr!28601 (Array (_ BitVec 32) ValueCell!10363)) (size!29080 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59465)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965220 (= res!646092 (and (= (size!29080 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29079 _keys!1686) (size!29080 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965221 () Bool)

(declare-fun e!544120 () Bool)

(declare-fun tp_is_empty!21689 () Bool)

(assert (=> b!965221 (= e!544120 tp_is_empty!21689)))

(declare-fun mapIsEmpty!34528 () Bool)

(declare-fun mapRes!34528 () Bool)

(assert (=> mapIsEmpty!34528 mapRes!34528))

(declare-fun b!965222 () Bool)

(assert (=> b!965222 (= e!544121 false)))

(declare-fun minValue!1342 () V!33901)

(declare-fun lt!431215 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33901)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14006 0))(
  ( (tuple2!14007 (_1!7014 (_ BitVec 64)) (_2!7014 V!33901)) )
))
(declare-datatypes ((List!19850 0))(
  ( (Nil!19847) (Cons!19846 (h!21008 tuple2!14006) (t!28213 List!19850)) )
))
(declare-datatypes ((ListLongMap!12703 0))(
  ( (ListLongMap!12704 (toList!6367 List!19850)) )
))
(declare-fun contains!5470 (ListLongMap!12703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3600 (array!59463 array!59465 (_ BitVec 32) (_ BitVec 32) V!33901 V!33901 (_ BitVec 32) Int) ListLongMap!12703)

(assert (=> b!965222 (= lt!431215 (contains!5470 (getCurrentListMap!3600 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28600 _keys!1686) i!803)))))

(declare-fun b!965223 () Bool)

(declare-fun res!646093 () Bool)

(assert (=> b!965223 (=> (not res!646093) (not e!544121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59463 (_ BitVec 32)) Bool)

(assert (=> b!965223 (= res!646093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965224 () Bool)

(declare-fun e!544117 () Bool)

(assert (=> b!965224 (= e!544117 tp_is_empty!21689)))

(declare-fun b!965225 () Bool)

(declare-fun res!646095 () Bool)

(assert (=> b!965225 (=> (not res!646095) (not e!544121))))

(declare-datatypes ((List!19851 0))(
  ( (Nil!19848) (Cons!19847 (h!21009 (_ BitVec 64)) (t!28214 List!19851)) )
))
(declare-fun arrayNoDuplicates!0 (array!59463 (_ BitVec 32) List!19851) Bool)

(assert (=> b!965225 (= res!646095 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19848))))

(declare-fun mapNonEmpty!34528 () Bool)

(declare-fun tp!65780 () Bool)

(assert (=> mapNonEmpty!34528 (= mapRes!34528 (and tp!65780 e!544117))))

(declare-fun mapValue!34528 () ValueCell!10363)

(declare-fun mapRest!34528 () (Array (_ BitVec 32) ValueCell!10363))

(declare-fun mapKey!34528 () (_ BitVec 32))

(assert (=> mapNonEmpty!34528 (= (arr!28601 _values!1400) (store mapRest!34528 mapKey!34528 mapValue!34528))))

(declare-fun b!965226 () Bool)

(declare-fun res!646096 () Bool)

(assert (=> b!965226 (=> (not res!646096) (not e!544121))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965226 (= res!646096 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29079 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29079 _keys!1686))))))

(declare-fun res!646094 () Bool)

(assert (=> start!82754 (=> (not res!646094) (not e!544121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82754 (= res!646094 (validMask!0 mask!2110))))

(assert (=> start!82754 e!544121))

(assert (=> start!82754 true))

(declare-fun e!544118 () Bool)

(declare-fun array_inv!22149 (array!59465) Bool)

(assert (=> start!82754 (and (array_inv!22149 _values!1400) e!544118)))

(declare-fun array_inv!22150 (array!59463) Bool)

(assert (=> start!82754 (array_inv!22150 _keys!1686)))

(assert (=> start!82754 tp!65781))

(assert (=> start!82754 tp_is_empty!21689))

(declare-fun b!965227 () Bool)

(assert (=> b!965227 (= e!544118 (and e!544120 mapRes!34528))))

(declare-fun condMapEmpty!34528 () Bool)

(declare-fun mapDefault!34528 () ValueCell!10363)

