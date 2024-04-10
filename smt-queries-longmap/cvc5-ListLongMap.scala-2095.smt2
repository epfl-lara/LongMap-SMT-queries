; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35738 () Bool)

(assert start!35738)

(declare-fun b_free!7921 () Bool)

(declare-fun b_next!7921 () Bool)

(assert (=> start!35738 (= b_free!7921 (not b_next!7921))))

(declare-fun tp!27854 () Bool)

(declare-fun b_and!15163 () Bool)

(assert (=> start!35738 (= tp!27854 b_and!15163)))

(declare-fun b!358988 () Bool)

(declare-fun res!199537 () Bool)

(declare-fun e!219811 () Bool)

(assert (=> b!358988 (=> (not res!199537) (not e!219811))))

(declare-datatypes ((array!19941 0))(
  ( (array!19942 (arr!9464 (Array (_ BitVec 32) (_ BitVec 64))) (size!9816 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19941)

(declare-datatypes ((List!5450 0))(
  ( (Nil!5447) (Cons!5446 (h!6302 (_ BitVec 64)) (t!10600 List!5450)) )
))
(declare-fun arrayNoDuplicates!0 (array!19941 (_ BitVec 32) List!5450) Bool)

(assert (=> b!358988 (= res!199537 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5447))))

(declare-fun mapNonEmpty!13794 () Bool)

(declare-fun mapRes!13794 () Bool)

(declare-fun tp!27855 () Bool)

(declare-fun e!219812 () Bool)

(assert (=> mapNonEmpty!13794 (= mapRes!13794 (and tp!27855 e!219812))))

(declare-datatypes ((V!11899 0))(
  ( (V!11900 (val!4140 Int)) )
))
(declare-datatypes ((ValueCell!3752 0))(
  ( (ValueCellFull!3752 (v!6334 V!11899)) (EmptyCell!3752) )
))
(declare-fun mapRest!13794 () (Array (_ BitVec 32) ValueCell!3752))

(declare-fun mapKey!13794 () (_ BitVec 32))

(declare-fun mapValue!13794 () ValueCell!3752)

(declare-datatypes ((array!19943 0))(
  ( (array!19944 (arr!9465 (Array (_ BitVec 32) ValueCell!3752)) (size!9817 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19943)

(assert (=> mapNonEmpty!13794 (= (arr!9465 _values!1208) (store mapRest!13794 mapKey!13794 mapValue!13794))))

(declare-fun res!199533 () Bool)

(assert (=> start!35738 (=> (not res!199533) (not e!219811))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35738 (= res!199533 (validMask!0 mask!1842))))

(assert (=> start!35738 e!219811))

(declare-fun tp_is_empty!8191 () Bool)

(assert (=> start!35738 tp_is_empty!8191))

(assert (=> start!35738 true))

(assert (=> start!35738 tp!27854))

(declare-fun array_inv!6962 (array!19941) Bool)

(assert (=> start!35738 (array_inv!6962 _keys!1456)))

(declare-fun e!219810 () Bool)

(declare-fun array_inv!6963 (array!19943) Bool)

(assert (=> start!35738 (and (array_inv!6963 _values!1208) e!219810)))

(declare-fun b!358989 () Bool)

(declare-fun res!199540 () Bool)

(assert (=> b!358989 (=> (not res!199540) (not e!219811))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!358989 (= res!199540 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9816 _keys!1456))))))

(declare-fun b!358990 () Bool)

(declare-fun res!199532 () Bool)

(assert (=> b!358990 (=> (not res!199532) (not e!219811))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358990 (= res!199532 (= (select (arr!9464 _keys!1456) from!1805) k!1077))))

(declare-fun b!358991 () Bool)

(declare-fun res!199535 () Bool)

(assert (=> b!358991 (=> (not res!199535) (not e!219811))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358991 (= res!199535 (and (= (size!9817 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9816 _keys!1456) (size!9817 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358992 () Bool)

(declare-fun e!219808 () Bool)

(assert (=> b!358992 (= e!219810 (and e!219808 mapRes!13794))))

(declare-fun condMapEmpty!13794 () Bool)

(declare-fun mapDefault!13794 () ValueCell!3752)

