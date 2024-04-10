; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4144 () Bool)

(assert start!4144)

(declare-fun b_free!1049 () Bool)

(declare-fun b_next!1049 () Bool)

(assert (=> start!4144 (= b_free!1049 (not b_next!1049))))

(declare-fun tp!4566 () Bool)

(declare-fun b_and!1859 () Bool)

(assert (=> start!4144 (= tp!4566 b_and!1859)))

(declare-fun b!31160 () Bool)

(declare-fun res!18860 () Bool)

(declare-fun e!19930 () Bool)

(assert (=> b!31160 (=> (not res!18860) (not e!19930))))

(declare-datatypes ((array!2029 0))(
  ( (array!2030 (arr!968 (Array (_ BitVec 32) (_ BitVec 64))) (size!1069 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2029)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31160 (= res!18860 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31161 () Bool)

(declare-fun res!18861 () Bool)

(assert (=> b!31161 (=> (not res!18861) (not e!19930))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2029 (_ BitVec 32)) Bool)

(assert (=> b!31161 (= res!18861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31162 () Bool)

(declare-fun e!19932 () Bool)

(declare-fun tp_is_empty!1403 () Bool)

(assert (=> b!31162 (= e!19932 tp_is_empty!1403)))

(declare-fun b!31163 () Bool)

(declare-fun res!18863 () Bool)

(assert (=> b!31163 (=> (not res!18863) (not e!19930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31163 (= res!18863 (validKeyInArray!0 k!1304))))

(declare-fun b!31164 () Bool)

(declare-fun res!18864 () Bool)

(assert (=> b!31164 (=> (not res!18864) (not e!19930))))

(declare-datatypes ((List!786 0))(
  ( (Nil!783) (Cons!782 (h!1349 (_ BitVec 64)) (t!3479 List!786)) )
))
(declare-fun arrayNoDuplicates!0 (array!2029 (_ BitVec 32) List!786) Bool)

(assert (=> b!31164 (= res!18864 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!783))))

(declare-fun res!18862 () Bool)

(assert (=> start!4144 (=> (not res!18862) (not e!19930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4144 (= res!18862 (validMask!0 mask!2294))))

(assert (=> start!4144 e!19930))

(assert (=> start!4144 true))

(assert (=> start!4144 tp!4566))

(declare-datatypes ((V!1695 0))(
  ( (V!1696 (val!728 Int)) )
))
(declare-datatypes ((ValueCell!502 0))(
  ( (ValueCellFull!502 (v!1817 V!1695)) (EmptyCell!502) )
))
(declare-datatypes ((array!2031 0))(
  ( (array!2032 (arr!969 (Array (_ BitVec 32) ValueCell!502)) (size!1070 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2031)

(declare-fun e!19933 () Bool)

(declare-fun array_inv!677 (array!2031) Bool)

(assert (=> start!4144 (and (array_inv!677 _values!1501) e!19933)))

(declare-fun array_inv!678 (array!2029) Bool)

(assert (=> start!4144 (array_inv!678 _keys!1833)))

(assert (=> start!4144 tp_is_empty!1403))

(declare-fun b!31165 () Bool)

(declare-fun res!18858 () Bool)

(assert (=> b!31165 (=> (not res!18858) (not e!19930))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31165 (= res!18858 (and (= (size!1070 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1069 _keys!1833) (size!1070 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31166 () Bool)

(assert (=> b!31166 (= e!19930 (not (= (size!1069 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun mapIsEmpty!1633 () Bool)

(declare-fun mapRes!1633 () Bool)

(assert (=> mapIsEmpty!1633 mapRes!1633))

(declare-fun b!31167 () Bool)

(declare-fun e!19931 () Bool)

(assert (=> b!31167 (= e!19933 (and e!19931 mapRes!1633))))

(declare-fun condMapEmpty!1633 () Bool)

(declare-fun mapDefault!1633 () ValueCell!502)

