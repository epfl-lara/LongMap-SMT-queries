; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108384 () Bool)

(assert start!108384)

(declare-fun b_free!27931 () Bool)

(declare-fun b_next!27931 () Bool)

(assert (=> start!108384 (= b_free!27931 (not b_next!27931))))

(declare-fun tp!98902 () Bool)

(declare-fun b_and!45991 () Bool)

(assert (=> start!108384 (= tp!98902 b_and!45991)))

(declare-fun b!1279176 () Bool)

(declare-fun e!730849 () Bool)

(declare-fun tp_is_empty!33571 () Bool)

(assert (=> b!1279176 (= e!730849 tp_is_empty!33571)))

(declare-fun b!1279177 () Bool)

(declare-fun res!849745 () Bool)

(declare-fun e!730847 () Bool)

(assert (=> b!1279177 (=> (not res!849745) (not e!730847))))

(declare-datatypes ((array!84230 0))(
  ( (array!84231 (arr!40619 (Array (_ BitVec 32) (_ BitVec 64))) (size!41169 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84230)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84230 (_ BitVec 32)) Bool)

(assert (=> b!1279177 (= res!849745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279178 () Bool)

(declare-fun res!849746 () Bool)

(assert (=> b!1279178 (=> (not res!849746) (not e!730847))))

(declare-datatypes ((List!28769 0))(
  ( (Nil!28766) (Cons!28765 (h!29974 (_ BitVec 64)) (t!42309 List!28769)) )
))
(declare-fun arrayNoDuplicates!0 (array!84230 (_ BitVec 32) List!28769) Bool)

(assert (=> b!1279178 (= res!849746 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28766))))

(declare-fun b!1279179 () Bool)

(declare-fun e!730850 () Bool)

(declare-fun mapRes!51908 () Bool)

(assert (=> b!1279179 (= e!730850 (and e!730849 mapRes!51908))))

(declare-fun condMapEmpty!51908 () Bool)

(declare-datatypes ((V!49865 0))(
  ( (V!49866 (val!16860 Int)) )
))
(declare-datatypes ((ValueCell!15887 0))(
  ( (ValueCellFull!15887 (v!19460 V!49865)) (EmptyCell!15887) )
))
(declare-datatypes ((array!84232 0))(
  ( (array!84233 (arr!40620 (Array (_ BitVec 32) ValueCell!15887)) (size!41170 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84232)

(declare-fun mapDefault!51908 () ValueCell!15887)

