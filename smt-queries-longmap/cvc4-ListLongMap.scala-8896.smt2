; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108020 () Bool)

(assert start!108020)

(declare-fun b!1275874 () Bool)

(declare-fun e!728454 () Bool)

(assert (=> b!1275874 (= e!728454 false)))

(declare-fun lt!575407 () Bool)

(declare-datatypes ((array!83686 0))(
  ( (array!83687 (arr!40355 (Array (_ BitVec 32) (_ BitVec 64))) (size!40905 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83686)

(declare-datatypes ((List!28628 0))(
  ( (Nil!28625) (Cons!28624 (h!29833 (_ BitVec 64)) (t!42164 List!28628)) )
))
(declare-fun arrayNoDuplicates!0 (array!83686 (_ BitVec 32) List!28628) Bool)

(assert (=> b!1275874 (= lt!575407 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28625))))

(declare-fun b!1275875 () Bool)

(declare-fun e!728452 () Bool)

(declare-fun e!728451 () Bool)

(declare-fun mapRes!51467 () Bool)

(assert (=> b!1275875 (= e!728452 (and e!728451 mapRes!51467))))

(declare-fun condMapEmpty!51467 () Bool)

(declare-datatypes ((V!49493 0))(
  ( (V!49494 (val!16721 Int)) )
))
(declare-datatypes ((ValueCell!15748 0))(
  ( (ValueCellFull!15748 (v!19318 V!49493)) (EmptyCell!15748) )
))
(declare-datatypes ((array!83688 0))(
  ( (array!83689 (arr!40356 (Array (_ BitVec 32) ValueCell!15748)) (size!40906 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83688)

(declare-fun mapDefault!51467 () ValueCell!15748)

