; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84408 () Bool)

(assert start!84408)

(declare-fun b_free!19979 () Bool)

(declare-fun b_next!19979 () Bool)

(assert (=> start!84408 (= b_free!19979 (not b_next!19979))))

(declare-fun tp!69715 () Bool)

(declare-fun b_and!32021 () Bool)

(assert (=> start!84408 (= tp!69715 b_and!32021)))

(declare-fun res!660491 () Bool)

(declare-fun e!556727 () Bool)

(assert (=> start!84408 (=> (not res!660491) (not e!556727))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84408 (= res!660491 (validMask!0 mask!1948))))

(assert (=> start!84408 e!556727))

(assert (=> start!84408 true))

(declare-fun tp_is_empty!23195 () Bool)

(assert (=> start!84408 tp_is_empty!23195))

(declare-datatypes ((V!35909 0))(
  ( (V!35910 (val!11648 Int)) )
))
(declare-datatypes ((ValueCell!11116 0))(
  ( (ValueCellFull!11116 (v!14211 V!35909)) (EmptyCell!11116) )
))
(declare-datatypes ((array!62347 0))(
  ( (array!62348 (arr!30030 (Array (_ BitVec 32) ValueCell!11116)) (size!30509 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62347)

(declare-fun e!556726 () Bool)

(declare-fun array_inv!23203 (array!62347) Bool)

(assert (=> start!84408 (and (array_inv!23203 _values!1278) e!556726)))

(assert (=> start!84408 tp!69715))

(declare-datatypes ((array!62349 0))(
  ( (array!62350 (arr!30031 (Array (_ BitVec 32) (_ BitVec 64))) (size!30510 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62349)

(declare-fun array_inv!23204 (array!62349) Bool)

(assert (=> start!84408 (array_inv!23204 _keys!1544)))

(declare-fun b!987278 () Bool)

(declare-fun res!660489 () Bool)

(assert (=> b!987278 (=> (not res!660489) (not e!556727))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987278 (= res!660489 (validKeyInArray!0 (select (arr!30031 _keys!1544) from!1932)))))

(declare-fun b!987279 () Bool)

(assert (=> b!987279 (= e!556727 (not true))))

(declare-datatypes ((tuple2!14834 0))(
  ( (tuple2!14835 (_1!7428 (_ BitVec 64)) (_2!7428 V!35909)) )
))
(declare-datatypes ((List!20765 0))(
  ( (Nil!20762) (Cons!20761 (h!21923 tuple2!14834) (t!29672 List!20765)) )
))
(declare-datatypes ((ListLongMap!13531 0))(
  ( (ListLongMap!13532 (toList!6781 List!20765)) )
))
(declare-fun lt!437663 () ListLongMap!13531)

(declare-fun lt!437666 () tuple2!14834)

(declare-fun lt!437665 () tuple2!14834)

(declare-fun +!3066 (ListLongMap!13531 tuple2!14834) ListLongMap!13531)

(assert (=> b!987279 (= (+!3066 (+!3066 lt!437663 lt!437666) lt!437665) (+!3066 (+!3066 lt!437663 lt!437665) lt!437666))))

(declare-fun lt!437662 () V!35909)

(assert (=> b!987279 (= lt!437665 (tuple2!14835 (select (arr!30031 _keys!1544) from!1932) lt!437662))))

(declare-fun minValue!1220 () V!35909)

(assert (=> b!987279 (= lt!437666 (tuple2!14835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32765 0))(
  ( (Unit!32766) )
))
(declare-fun lt!437664 () Unit!32765)

(declare-fun addCommutativeForDiffKeys!690 (ListLongMap!13531 (_ BitVec 64) V!35909 (_ BitVec 64) V!35909) Unit!32765)

(assert (=> b!987279 (= lt!437664 (addCommutativeForDiffKeys!690 lt!437663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30031 _keys!1544) from!1932) lt!437662))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15574 (ValueCell!11116 V!35909) V!35909)

(declare-fun dynLambda!1849 (Int (_ BitVec 64)) V!35909)

(assert (=> b!987279 (= lt!437662 (get!15574 (select (arr!30030 _values!1278) from!1932) (dynLambda!1849 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35909)

(declare-fun getCurrentListMapNoExtraKeys!3472 (array!62349 array!62347 (_ BitVec 32) (_ BitVec 32) V!35909 V!35909 (_ BitVec 32) Int) ListLongMap!13531)

(assert (=> b!987279 (= lt!437663 (+!3066 (getCurrentListMapNoExtraKeys!3472 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987280 () Bool)

(declare-fun res!660487 () Bool)

(assert (=> b!987280 (=> (not res!660487) (not e!556727))))

(assert (=> b!987280 (= res!660487 (and (= (size!30509 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30510 _keys!1544) (size!30509 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987281 () Bool)

(declare-fun e!556724 () Bool)

(assert (=> b!987281 (= e!556724 tp_is_empty!23195)))

(declare-fun b!987282 () Bool)

(declare-fun res!660485 () Bool)

(assert (=> b!987282 (=> (not res!660485) (not e!556727))))

(assert (=> b!987282 (= res!660485 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987283 () Bool)

(declare-fun res!660486 () Bool)

(assert (=> b!987283 (=> (not res!660486) (not e!556727))))

(declare-datatypes ((List!20766 0))(
  ( (Nil!20763) (Cons!20762 (h!21924 (_ BitVec 64)) (t!29673 List!20766)) )
))
(declare-fun arrayNoDuplicates!0 (array!62349 (_ BitVec 32) List!20766) Bool)

(assert (=> b!987283 (= res!660486 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20763))))

(declare-fun b!987284 () Bool)

(declare-fun mapRes!36824 () Bool)

(assert (=> b!987284 (= e!556726 (and e!556724 mapRes!36824))))

(declare-fun condMapEmpty!36824 () Bool)

(declare-fun mapDefault!36824 () ValueCell!11116)

