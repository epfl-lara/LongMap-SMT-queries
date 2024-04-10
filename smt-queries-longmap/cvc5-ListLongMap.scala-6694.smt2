; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84136 () Bool)

(assert start!84136)

(declare-fun b!983722 () Bool)

(declare-fun res!658244 () Bool)

(declare-fun e!554595 () Bool)

(assert (=> b!983722 (=> (not res!658244) (not e!554595))))

(declare-datatypes ((array!61861 0))(
  ( (array!61862 (arr!29788 (Array (_ BitVec 32) (_ BitVec 64))) (size!30267 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61861)

(declare-datatypes ((List!20623 0))(
  ( (Nil!20620) (Cons!20619 (h!21781 (_ BitVec 64)) (t!29414 List!20623)) )
))
(declare-fun arrayNoDuplicates!0 (array!61861 (_ BitVec 32) List!20623) Bool)

(assert (=> b!983722 (= res!658244 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20620))))

(declare-fun b!983723 () Bool)

(declare-fun e!554594 () Bool)

(declare-fun tp_is_empty!22939 () Bool)

(assert (=> b!983723 (= e!554594 tp_is_empty!22939)))

(declare-fun mapNonEmpty!36437 () Bool)

(declare-fun mapRes!36437 () Bool)

(declare-fun tp!69121 () Bool)

(declare-fun e!554592 () Bool)

(assert (=> mapNonEmpty!36437 (= mapRes!36437 (and tp!69121 e!554592))))

(declare-datatypes ((V!35569 0))(
  ( (V!35570 (val!11520 Int)) )
))
(declare-datatypes ((ValueCell!10988 0))(
  ( (ValueCellFull!10988 (v!14082 V!35569)) (EmptyCell!10988) )
))
(declare-datatypes ((array!61863 0))(
  ( (array!61864 (arr!29789 (Array (_ BitVec 32) ValueCell!10988)) (size!30268 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61863)

(declare-fun mapKey!36437 () (_ BitVec 32))

(declare-fun mapRest!36437 () (Array (_ BitVec 32) ValueCell!10988))

(declare-fun mapValue!36437 () ValueCell!10988)

(assert (=> mapNonEmpty!36437 (= (arr!29789 _values!1278) (store mapRest!36437 mapKey!36437 mapValue!36437))))

(declare-fun mapIsEmpty!36437 () Bool)

(assert (=> mapIsEmpty!36437 mapRes!36437))

(declare-fun b!983724 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983724 (= e!554595 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!983725 () Bool)

(assert (=> b!983725 (= e!554592 tp_is_empty!22939)))

(declare-fun res!658242 () Bool)

(assert (=> start!84136 (=> (not res!658242) (not e!554595))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84136 (= res!658242 (validMask!0 mask!1948))))

(assert (=> start!84136 e!554595))

(assert (=> start!84136 true))

(declare-fun e!554591 () Bool)

(declare-fun array_inv!23033 (array!61863) Bool)

(assert (=> start!84136 (and (array_inv!23033 _values!1278) e!554591)))

(declare-fun array_inv!23034 (array!61861) Bool)

(assert (=> start!84136 (array_inv!23034 _keys!1544)))

(declare-fun b!983726 () Bool)

(declare-fun res!658241 () Bool)

(assert (=> b!983726 (=> (not res!658241) (not e!554595))))

(assert (=> b!983726 (= res!658241 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30267 _keys!1544))))))

(declare-fun b!983727 () Bool)

(declare-fun res!658240 () Bool)

(assert (=> b!983727 (=> (not res!658240) (not e!554595))))

(assert (=> b!983727 (= res!658240 (and (= (size!30268 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30267 _keys!1544) (size!30268 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983728 () Bool)

(declare-fun res!658239 () Bool)

(assert (=> b!983728 (=> (not res!658239) (not e!554595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983728 (= res!658239 (validKeyInArray!0 (select (arr!29788 _keys!1544) from!1932)))))

(declare-fun b!983729 () Bool)

(declare-fun res!658243 () Bool)

(assert (=> b!983729 (=> (not res!658243) (not e!554595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61861 (_ BitVec 32)) Bool)

(assert (=> b!983729 (= res!658243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983730 () Bool)

(assert (=> b!983730 (= e!554591 (and e!554594 mapRes!36437))))

(declare-fun condMapEmpty!36437 () Bool)

(declare-fun mapDefault!36437 () ValueCell!10988)

