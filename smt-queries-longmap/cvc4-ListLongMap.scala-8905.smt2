; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108084 () Bool)

(assert start!108084)

(declare-fun b_free!27797 () Bool)

(declare-fun b_next!27797 () Bool)

(assert (=> start!108084 (= b_free!27797 (not b_next!27797))))

(declare-fun tp!98345 () Bool)

(declare-fun b_and!45853 () Bool)

(assert (=> start!108084 (= tp!98345 b_and!45853)))

(declare-fun b!1276440 () Bool)

(declare-fun res!848286 () Bool)

(declare-fun e!728885 () Bool)

(assert (=> b!1276440 (=> (not res!848286) (not e!728885))))

(declare-datatypes ((array!83788 0))(
  ( (array!83789 (arr!40405 (Array (_ BitVec 32) (_ BitVec 64))) (size!40955 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83788)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83788 (_ BitVec 32)) Bool)

(assert (=> b!1276440 (= res!848286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276441 () Bool)

(declare-fun e!728884 () Bool)

(declare-fun tp_is_empty!33347 () Bool)

(assert (=> b!1276441 (= e!728884 tp_is_empty!33347)))

(declare-fun b!1276442 () Bool)

(declare-fun res!848284 () Bool)

(assert (=> b!1276442 (=> (not res!848284) (not e!728885))))

(declare-datatypes ((List!28655 0))(
  ( (Nil!28652) (Cons!28651 (h!29860 (_ BitVec 64)) (t!42191 List!28655)) )
))
(declare-fun arrayNoDuplicates!0 (array!83788 (_ BitVec 32) List!28655) Bool)

(assert (=> b!1276442 (= res!848284 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28652))))

(declare-fun b!1276443 () Bool)

(declare-fun e!728886 () Bool)

(assert (=> b!1276443 (= e!728886 tp_is_empty!33347)))

(declare-fun mapIsEmpty!51551 () Bool)

(declare-fun mapRes!51551 () Bool)

(assert (=> mapIsEmpty!51551 mapRes!51551))

(declare-fun b!1276444 () Bool)

(declare-fun e!728882 () Bool)

(assert (=> b!1276444 (= e!728882 (and e!728886 mapRes!51551))))

(declare-fun condMapEmpty!51551 () Bool)

(declare-datatypes ((V!49565 0))(
  ( (V!49566 (val!16748 Int)) )
))
(declare-datatypes ((ValueCell!15775 0))(
  ( (ValueCellFull!15775 (v!19345 V!49565)) (EmptyCell!15775) )
))
(declare-datatypes ((array!83790 0))(
  ( (array!83791 (arr!40406 (Array (_ BitVec 32) ValueCell!15775)) (size!40956 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83790)

(declare-fun mapDefault!51551 () ValueCell!15775)

