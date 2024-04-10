; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77560 () Bool)

(assert start!77560)

(declare-fun b_free!16145 () Bool)

(declare-fun b_next!16145 () Bool)

(assert (=> start!77560 (= b_free!16145 (not b_next!16145))))

(declare-fun tp!56697 () Bool)

(declare-fun b_and!26511 () Bool)

(assert (=> start!77560 (= tp!56697 b_and!26511)))

(declare-fun b!903656 () Bool)

(declare-fun e!506337 () Bool)

(declare-fun tp_is_empty!18563 () Bool)

(assert (=> b!903656 (= e!506337 tp_is_empty!18563)))

(declare-fun b!903658 () Bool)

(declare-fun e!506336 () Bool)

(assert (=> b!903658 (= e!506336 false)))

(declare-datatypes ((V!29715 0))(
  ( (V!29716 (val!9332 Int)) )
))
(declare-datatypes ((ValueCell!8800 0))(
  ( (ValueCellFull!8800 (v!11837 V!29715)) (EmptyCell!8800) )
))
(declare-datatypes ((array!53178 0))(
  ( (array!53179 (arr!25548 (Array (_ BitVec 32) ValueCell!8800)) (size!26007 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53178)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29715)

(declare-datatypes ((array!53180 0))(
  ( (array!53181 (arr!25549 (Array (_ BitVec 32) (_ BitVec 64))) (size!26008 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53180)

(declare-fun lt!408039 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29715)

(declare-datatypes ((tuple2!12118 0))(
  ( (tuple2!12119 (_1!6070 (_ BitVec 64)) (_2!6070 V!29715)) )
))
(declare-datatypes ((List!17937 0))(
  ( (Nil!17934) (Cons!17933 (h!19079 tuple2!12118) (t!25320 List!17937)) )
))
(declare-datatypes ((ListLongMap!10815 0))(
  ( (ListLongMap!10816 (toList!5423 List!17937)) )
))
(declare-fun contains!4471 (ListLongMap!10815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2692 (array!53180 array!53178 (_ BitVec 32) (_ BitVec 32) V!29715 V!29715 (_ BitVec 32) Int) ListLongMap!10815)

(assert (=> b!903658 (= lt!408039 (contains!4471 (getCurrentListMap!2692 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903659 () Bool)

(declare-fun e!506338 () Bool)

(assert (=> b!903659 (= e!506338 tp_is_empty!18563)))

(declare-fun b!903660 () Bool)

(declare-fun res!609665 () Bool)

(assert (=> b!903660 (=> (not res!609665) (not e!506336))))

(assert (=> b!903660 (= res!609665 (and (= (size!26007 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26008 _keys!1386) (size!26007 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903661 () Bool)

(declare-fun res!609668 () Bool)

(assert (=> b!903661 (=> (not res!609668) (not e!506336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53180 (_ BitVec 32)) Bool)

(assert (=> b!903661 (= res!609668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29557 () Bool)

(declare-fun mapRes!29557 () Bool)

(assert (=> mapIsEmpty!29557 mapRes!29557))

(declare-fun res!609666 () Bool)

(assert (=> start!77560 (=> (not res!609666) (not e!506336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77560 (= res!609666 (validMask!0 mask!1756))))

(assert (=> start!77560 e!506336))

(declare-fun e!506339 () Bool)

(declare-fun array_inv!20018 (array!53178) Bool)

(assert (=> start!77560 (and (array_inv!20018 _values!1152) e!506339)))

(assert (=> start!77560 tp!56697))

(assert (=> start!77560 true))

(assert (=> start!77560 tp_is_empty!18563))

(declare-fun array_inv!20019 (array!53180) Bool)

(assert (=> start!77560 (array_inv!20019 _keys!1386)))

(declare-fun b!903657 () Bool)

(declare-fun res!609667 () Bool)

(assert (=> b!903657 (=> (not res!609667) (not e!506336))))

(declare-datatypes ((List!17938 0))(
  ( (Nil!17935) (Cons!17934 (h!19080 (_ BitVec 64)) (t!25321 List!17938)) )
))
(declare-fun arrayNoDuplicates!0 (array!53180 (_ BitVec 32) List!17938) Bool)

(assert (=> b!903657 (= res!609667 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17935))))

(declare-fun b!903662 () Bool)

(assert (=> b!903662 (= e!506339 (and e!506337 mapRes!29557))))

(declare-fun condMapEmpty!29557 () Bool)

(declare-fun mapDefault!29557 () ValueCell!8800)

