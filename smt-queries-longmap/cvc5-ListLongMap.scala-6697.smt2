; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84154 () Bool)

(assert start!84154)

(declare-fun b_free!19855 () Bool)

(declare-fun b_next!19855 () Bool)

(assert (=> start!84154 (= b_free!19855 (not b_next!19855))))

(declare-fun tp!69168 () Bool)

(declare-fun b_and!31787 () Bool)

(assert (=> start!84154 (= tp!69168 b_and!31787)))

(declare-fun res!658436 () Bool)

(declare-fun e!554742 () Bool)

(assert (=> start!84154 (=> (not res!658436) (not e!554742))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84154 (= res!658436 (validMask!0 mask!1948))))

(assert (=> start!84154 e!554742))

(assert (=> start!84154 true))

(declare-fun tp_is_empty!22957 () Bool)

(assert (=> start!84154 tp_is_empty!22957))

(declare-datatypes ((V!35593 0))(
  ( (V!35594 (val!11529 Int)) )
))
(declare-datatypes ((ValueCell!10997 0))(
  ( (ValueCellFull!10997 (v!14091 V!35593)) (EmptyCell!10997) )
))
(declare-datatypes ((array!61895 0))(
  ( (array!61896 (arr!29805 (Array (_ BitVec 32) ValueCell!10997)) (size!30284 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61895)

(declare-fun e!554737 () Bool)

(declare-fun array_inv!23047 (array!61895) Bool)

(assert (=> start!84154 (and (array_inv!23047 _values!1278) e!554737)))

(assert (=> start!84154 tp!69168))

(declare-datatypes ((array!61897 0))(
  ( (array!61898 (arr!29806 (Array (_ BitVec 32) (_ BitVec 64))) (size!30285 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61897)

(declare-fun array_inv!23048 (array!61897) Bool)

(assert (=> start!84154 (array_inv!23048 _keys!1544)))

(declare-fun b!984002 () Bool)

(declare-fun res!658437 () Bool)

(assert (=> b!984002 (=> (not res!658437) (not e!554742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61897 (_ BitVec 32)) Bool)

(assert (=> b!984002 (= res!658437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36464 () Bool)

(declare-fun mapRes!36464 () Bool)

(assert (=> mapIsEmpty!36464 mapRes!36464))

(declare-fun b!984003 () Bool)

(declare-fun res!658439 () Bool)

(assert (=> b!984003 (=> (not res!658439) (not e!554742))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984003 (= res!658439 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30285 _keys!1544))))))

(declare-fun b!984004 () Bool)

(declare-fun e!554741 () Bool)

(assert (=> b!984004 (= e!554741 (not true))))

(declare-datatypes ((tuple2!14742 0))(
  ( (tuple2!14743 (_1!7382 (_ BitVec 64)) (_2!7382 V!35593)) )
))
(declare-datatypes ((List!20634 0))(
  ( (Nil!20631) (Cons!20630 (h!21792 tuple2!14742) (t!29433 List!20634)) )
))
(declare-datatypes ((ListLongMap!13439 0))(
  ( (ListLongMap!13440 (toList!6735 List!20634)) )
))
(declare-fun lt!436630 () ListLongMap!13439)

(declare-fun lt!436629 () tuple2!14742)

(declare-fun lt!436627 () tuple2!14742)

(declare-fun +!3028 (ListLongMap!13439 tuple2!14742) ListLongMap!13439)

(assert (=> b!984004 (= (+!3028 (+!3028 lt!436630 lt!436629) lt!436627) (+!3028 (+!3028 lt!436630 lt!436627) lt!436629))))

(declare-fun lt!436628 () V!35593)

(assert (=> b!984004 (= lt!436627 (tuple2!14743 (select (arr!29806 _keys!1544) from!1932) lt!436628))))

(declare-fun minValue!1220 () V!35593)

(assert (=> b!984004 (= lt!436629 (tuple2!14743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32695 0))(
  ( (Unit!32696) )
))
(declare-fun lt!436631 () Unit!32695)

(declare-fun addCommutativeForDiffKeys!656 (ListLongMap!13439 (_ BitVec 64) V!35593 (_ BitVec 64) V!35593) Unit!32695)

(assert (=> b!984004 (= lt!436631 (addCommutativeForDiffKeys!656 lt!436630 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29806 _keys!1544) from!1932) lt!436628))))

(declare-fun mapNonEmpty!36464 () Bool)

(declare-fun tp!69169 () Bool)

(declare-fun e!554738 () Bool)

(assert (=> mapNonEmpty!36464 (= mapRes!36464 (and tp!69169 e!554738))))

(declare-fun mapRest!36464 () (Array (_ BitVec 32) ValueCell!10997))

(declare-fun mapKey!36464 () (_ BitVec 32))

(declare-fun mapValue!36464 () ValueCell!10997)

(assert (=> mapNonEmpty!36464 (= (arr!29805 _values!1278) (store mapRest!36464 mapKey!36464 mapValue!36464))))

(declare-fun b!984005 () Bool)

(assert (=> b!984005 (= e!554738 tp_is_empty!22957)))

(declare-fun b!984006 () Bool)

(declare-fun res!658432 () Bool)

(assert (=> b!984006 (=> (not res!658432) (not e!554742))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984006 (= res!658432 (and (= (size!30284 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30285 _keys!1544) (size!30284 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984007 () Bool)

(declare-fun e!554739 () Bool)

(assert (=> b!984007 (= e!554739 tp_is_empty!22957)))

(declare-fun b!984008 () Bool)

(declare-fun res!658438 () Bool)

(assert (=> b!984008 (=> (not res!658438) (not e!554742))))

(declare-datatypes ((List!20635 0))(
  ( (Nil!20632) (Cons!20631 (h!21793 (_ BitVec 64)) (t!29434 List!20635)) )
))
(declare-fun arrayNoDuplicates!0 (array!61897 (_ BitVec 32) List!20635) Bool)

(assert (=> b!984008 (= res!658438 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20632))))

(declare-fun b!984009 () Bool)

(assert (=> b!984009 (= e!554737 (and e!554739 mapRes!36464))))

(declare-fun condMapEmpty!36464 () Bool)

(declare-fun mapDefault!36464 () ValueCell!10997)

