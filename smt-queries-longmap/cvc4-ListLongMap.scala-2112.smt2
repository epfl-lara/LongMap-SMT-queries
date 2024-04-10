; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35844 () Bool)

(assert start!35844)

(declare-fun b!360249 () Bool)

(declare-fun res!200323 () Bool)

(declare-fun e!220605 () Bool)

(assert (=> b!360249 (=> (not res!200323) (not e!220605))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20145 0))(
  ( (array!20146 (arr!9566 (Array (_ BitVec 32) (_ BitVec 64))) (size!9918 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20145)

(assert (=> b!360249 (= res!200323 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9918 _keys!1456))))))

(declare-fun b!360250 () Bool)

(declare-fun res!200316 () Bool)

(assert (=> b!360250 (=> (not res!200316) (not e!220605))))

(declare-datatypes ((List!5485 0))(
  ( (Nil!5482) (Cons!5481 (h!6337 (_ BitVec 64)) (t!10635 List!5485)) )
))
(declare-fun arrayNoDuplicates!0 (array!20145 (_ BitVec 32) List!5485) Bool)

(assert (=> b!360250 (= res!200316 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5482))))

(declare-fun b!360251 () Bool)

(declare-fun res!200322 () Bool)

(assert (=> b!360251 (=> (not res!200322) (not e!220605))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!360251 (= res!200322 (not (= (select (arr!9566 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360252 () Bool)

(declare-fun res!200317 () Bool)

(assert (=> b!360252 (=> (not res!200317) (not e!220605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360252 (= res!200317 (validKeyInArray!0 k!1077))))

(declare-fun b!360253 () Bool)

(declare-fun res!200321 () Bool)

(assert (=> b!360253 (=> (not res!200321) (not e!220605))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12039 0))(
  ( (V!12040 (val!4193 Int)) )
))
(declare-datatypes ((ValueCell!3805 0))(
  ( (ValueCellFull!3805 (v!6387 V!12039)) (EmptyCell!3805) )
))
(declare-datatypes ((array!20147 0))(
  ( (array!20148 (arr!9567 (Array (_ BitVec 32) ValueCell!3805)) (size!9919 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20147)

(assert (=> b!360253 (= res!200321 (and (= (size!9919 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9918 _keys!1456) (size!9919 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13953 () Bool)

(declare-fun mapRes!13953 () Bool)

(declare-fun tp!28020 () Bool)

(declare-fun e!220607 () Bool)

(assert (=> mapNonEmpty!13953 (= mapRes!13953 (and tp!28020 e!220607))))

(declare-fun mapValue!13953 () ValueCell!3805)

(declare-fun mapKey!13953 () (_ BitVec 32))

(declare-fun mapRest!13953 () (Array (_ BitVec 32) ValueCell!3805))

(assert (=> mapNonEmpty!13953 (= (arr!9567 _values!1208) (store mapRest!13953 mapKey!13953 mapValue!13953))))

(declare-fun b!360254 () Bool)

(declare-fun e!220604 () Bool)

(declare-fun tp_is_empty!8297 () Bool)

(assert (=> b!360254 (= e!220604 tp_is_empty!8297)))

(declare-fun b!360255 () Bool)

(declare-fun res!200318 () Bool)

(assert (=> b!360255 (=> (not res!200318) (not e!220605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20145 (_ BitVec 32)) Bool)

(assert (=> b!360255 (= res!200318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360256 () Bool)

(assert (=> b!360256 (= e!220605 (not true))))

(declare-fun arrayContainsKey!0 (array!20145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360256 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12039)

(declare-datatypes ((Unit!11078 0))(
  ( (Unit!11079) )
))
(declare-fun lt!166433 () Unit!11078)

(declare-fun zeroValue!1150 () V!12039)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!54 (array!20145 array!20147 (_ BitVec 32) (_ BitVec 32) V!12039 V!12039 (_ BitVec 64) (_ BitVec 32)) Unit!11078)

(assert (=> b!360256 (= lt!166433 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!54 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360257 () Bool)

(declare-fun e!220603 () Bool)

(assert (=> b!360257 (= e!220603 (and e!220604 mapRes!13953))))

(declare-fun condMapEmpty!13953 () Bool)

(declare-fun mapDefault!13953 () ValueCell!3805)

