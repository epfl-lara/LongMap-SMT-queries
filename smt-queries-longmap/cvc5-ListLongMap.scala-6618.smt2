; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83658 () Bool)

(assert start!83658)

(declare-fun b!977136 () Bool)

(declare-fun res!654010 () Bool)

(declare-fun e!550791 () Bool)

(assert (=> b!977136 (=> (not res!654010) (not e!550791))))

(declare-datatypes ((array!60997 0))(
  ( (array!60998 (arr!29358 (Array (_ BitVec 32) (_ BitVec 64))) (size!29837 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60997)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60997 (_ BitVec 32)) Bool)

(assert (=> b!977136 (= res!654010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977137 () Bool)

(declare-fun e!550790 () Bool)

(declare-fun tp_is_empty!22483 () Bool)

(assert (=> b!977137 (= e!550790 tp_is_empty!22483)))

(declare-fun mapIsEmpty!35747 () Bool)

(declare-fun mapRes!35747 () Bool)

(assert (=> mapIsEmpty!35747 mapRes!35747))

(declare-fun b!977138 () Bool)

(declare-fun res!654011 () Bool)

(assert (=> b!977138 (=> (not res!654011) (not e!550791))))

(assert (=> b!977138 (= res!654011 (and (bvsle #b00000000000000000000000000000000 (size!29837 _keys!1544)) (bvslt (size!29837 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977139 () Bool)

(declare-datatypes ((List!20367 0))(
  ( (Nil!20364) (Cons!20363 (h!21525 (_ BitVec 64)) (t!28882 List!20367)) )
))
(declare-fun noDuplicate!1373 (List!20367) Bool)

(assert (=> b!977139 (= e!550791 (not (noDuplicate!1373 Nil!20364)))))

(declare-fun b!977140 () Bool)

(declare-fun res!654009 () Bool)

(assert (=> b!977140 (=> (not res!654009) (not e!550791))))

(declare-datatypes ((V!34961 0))(
  ( (V!34962 (val!11292 Int)) )
))
(declare-datatypes ((ValueCell!10760 0))(
  ( (ValueCellFull!10760 (v!13853 V!34961)) (EmptyCell!10760) )
))
(declare-datatypes ((array!60999 0))(
  ( (array!61000 (arr!29359 (Array (_ BitVec 32) ValueCell!10760)) (size!29838 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60999)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977140 (= res!654009 (and (= (size!29838 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29837 _keys!1544) (size!29838 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977141 () Bool)

(declare-fun e!550788 () Bool)

(assert (=> b!977141 (= e!550788 (and e!550790 mapRes!35747))))

(declare-fun condMapEmpty!35747 () Bool)

(declare-fun mapDefault!35747 () ValueCell!10760)

