; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107112 () Bool)

(assert start!107112)

(declare-fun b_free!27617 () Bool)

(declare-fun b_next!27617 () Bool)

(assert (=> start!107112 (= b_free!27617 (not b_next!27617))))

(declare-fun tp!97078 () Bool)

(declare-fun b_and!45649 () Bool)

(assert (=> start!107112 (= tp!97078 b_and!45649)))

(declare-fun b!1269939 () Bool)

(declare-fun res!845120 () Bool)

(declare-fun e!723843 () Bool)

(assert (=> b!1269939 (=> (not res!845120) (not e!723843))))

(declare-datatypes ((array!82864 0))(
  ( (array!82865 (arr!39969 (Array (_ BitVec 32) (_ BitVec 64))) (size!40505 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82864)

(declare-datatypes ((List!28458 0))(
  ( (Nil!28455) (Cons!28454 (h!29663 (_ BitVec 64)) (t!41987 List!28458)) )
))
(declare-fun arrayNoDuplicates!0 (array!82864 (_ BitVec 32) List!28458) Bool)

(assert (=> b!1269939 (= res!845120 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28455))))

(declare-fun b!1269940 () Bool)

(declare-fun res!845117 () Bool)

(assert (=> b!1269940 (=> (not res!845117) (not e!723843))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82864 (_ BitVec 32)) Bool)

(assert (=> b!1269940 (= res!845117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269941 () Bool)

(declare-fun res!845116 () Bool)

(assert (=> b!1269941 (=> (not res!845116) (not e!723843))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269941 (= res!845116 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40505 _keys!1364)) (bvslt from!1698 (size!40505 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269942 () Bool)

(declare-fun e!723841 () Bool)

(declare-fun e!723842 () Bool)

(declare-fun mapRes!50782 () Bool)

(assert (=> b!1269942 (= e!723841 (and e!723842 mapRes!50782))))

(declare-fun condMapEmpty!50782 () Bool)

(declare-datatypes ((V!48927 0))(
  ( (V!48928 (val!16475 Int)) )
))
(declare-datatypes ((ValueCell!15547 0))(
  ( (ValueCellFull!15547 (v!19112 V!48927)) (EmptyCell!15547) )
))
(declare-datatypes ((array!82866 0))(
  ( (array!82867 (arr!39970 (Array (_ BitVec 32) ValueCell!15547)) (size!40506 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82866)

(declare-fun mapDefault!50782 () ValueCell!15547)

