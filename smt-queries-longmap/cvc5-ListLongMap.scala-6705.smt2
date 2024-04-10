; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84202 () Bool)

(assert start!84202)

(declare-fun b_free!19903 () Bool)

(declare-fun b_next!19903 () Bool)

(assert (=> start!84202 (= b_free!19903 (not b_next!19903))))

(declare-fun tp!69312 () Bool)

(declare-fun b_and!31883 () Bool)

(assert (=> start!84202 (= tp!69312 b_and!31883)))

(declare-fun b!984842 () Bool)

(declare-fun res!659015 () Bool)

(declare-fun e!555171 () Bool)

(assert (=> b!984842 (=> (not res!659015) (not e!555171))))

(declare-datatypes ((array!61989 0))(
  ( (array!61990 (arr!29852 (Array (_ BitVec 32) (_ BitVec 64))) (size!30331 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61989)

(declare-datatypes ((List!20670 0))(
  ( (Nil!20667) (Cons!20666 (h!21828 (_ BitVec 64)) (t!29517 List!20670)) )
))
(declare-fun arrayNoDuplicates!0 (array!61989 (_ BitVec 32) List!20670) Bool)

(assert (=> b!984842 (= res!659015 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20667))))

(declare-fun mapIsEmpty!36536 () Bool)

(declare-fun mapRes!36536 () Bool)

(assert (=> mapIsEmpty!36536 mapRes!36536))

(declare-fun b!984843 () Bool)

(declare-fun e!555174 () Bool)

(assert (=> b!984843 (= e!555171 e!555174)))

(declare-fun res!659008 () Bool)

(assert (=> b!984843 (=> (not res!659008) (not e!555174))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984843 (= res!659008 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29852 _keys!1544) from!1932))))))

(declare-datatypes ((V!35657 0))(
  ( (V!35658 (val!11553 Int)) )
))
(declare-datatypes ((ValueCell!11021 0))(
  ( (ValueCellFull!11021 (v!14115 V!35657)) (EmptyCell!11021) )
))
(declare-datatypes ((array!61991 0))(
  ( (array!61992 (arr!29853 (Array (_ BitVec 32) ValueCell!11021)) (size!30332 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61991)

(declare-fun lt!436990 () V!35657)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15488 (ValueCell!11021 V!35657) V!35657)

(declare-fun dynLambda!1825 (Int (_ BitVec 64)) V!35657)

(assert (=> b!984843 (= lt!436990 (get!15488 (select (arr!29853 _values!1278) from!1932) (dynLambda!1825 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35657)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14778 0))(
  ( (tuple2!14779 (_1!7400 (_ BitVec 64)) (_2!7400 V!35657)) )
))
(declare-datatypes ((List!20671 0))(
  ( (Nil!20668) (Cons!20667 (h!21829 tuple2!14778) (t!29518 List!20671)) )
))
(declare-datatypes ((ListLongMap!13475 0))(
  ( (ListLongMap!13476 (toList!6753 List!20671)) )
))
(declare-fun lt!436988 () ListLongMap!13475)

(declare-fun zeroValue!1220 () V!35657)

(declare-fun getCurrentListMapNoExtraKeys!3445 (array!61989 array!61991 (_ BitVec 32) (_ BitVec 32) V!35657 V!35657 (_ BitVec 32) Int) ListLongMap!13475)

(assert (=> b!984843 (= lt!436988 (getCurrentListMapNoExtraKeys!3445 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984844 () Bool)

(declare-fun e!555172 () Bool)

(declare-fun tp_is_empty!23005 () Bool)

(assert (=> b!984844 (= e!555172 tp_is_empty!23005)))

(declare-fun b!984845 () Bool)

(declare-fun res!659010 () Bool)

(assert (=> b!984845 (=> (not res!659010) (not e!555171))))

(assert (=> b!984845 (= res!659010 (and (= (size!30332 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30331 _keys!1544) (size!30332 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984846 () Bool)

(declare-fun res!659014 () Bool)

(assert (=> b!984846 (=> (not res!659014) (not e!555171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984846 (= res!659014 (validKeyInArray!0 (select (arr!29852 _keys!1544) from!1932)))))

(declare-fun b!984847 () Bool)

(assert (=> b!984847 (= e!555174 (not true))))

(declare-fun lt!436991 () tuple2!14778)

(declare-fun lt!436987 () tuple2!14778)

(declare-fun +!3044 (ListLongMap!13475 tuple2!14778) ListLongMap!13475)

(assert (=> b!984847 (= (+!3044 (+!3044 lt!436988 lt!436991) lt!436987) (+!3044 (+!3044 lt!436988 lt!436987) lt!436991))))

(assert (=> b!984847 (= lt!436987 (tuple2!14779 (select (arr!29852 _keys!1544) from!1932) lt!436990))))

(assert (=> b!984847 (= lt!436991 (tuple2!14779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32727 0))(
  ( (Unit!32728) )
))
(declare-fun lt!436989 () Unit!32727)

(declare-fun addCommutativeForDiffKeys!672 (ListLongMap!13475 (_ BitVec 64) V!35657 (_ BitVec 64) V!35657) Unit!32727)

(assert (=> b!984847 (= lt!436989 (addCommutativeForDiffKeys!672 lt!436988 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29852 _keys!1544) from!1932) lt!436990))))

(declare-fun res!659012 () Bool)

(assert (=> start!84202 (=> (not res!659012) (not e!555171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84202 (= res!659012 (validMask!0 mask!1948))))

(assert (=> start!84202 e!555171))

(assert (=> start!84202 true))

(assert (=> start!84202 tp_is_empty!23005))

(declare-fun e!555169 () Bool)

(declare-fun array_inv!23077 (array!61991) Bool)

(assert (=> start!84202 (and (array_inv!23077 _values!1278) e!555169)))

(assert (=> start!84202 tp!69312))

(declare-fun array_inv!23078 (array!61989) Bool)

(assert (=> start!84202 (array_inv!23078 _keys!1544)))

(declare-fun b!984848 () Bool)

(declare-fun res!659011 () Bool)

(assert (=> b!984848 (=> (not res!659011) (not e!555171))))

(assert (=> b!984848 (= res!659011 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984849 () Bool)

(declare-fun res!659013 () Bool)

(assert (=> b!984849 (=> (not res!659013) (not e!555171))))

(assert (=> b!984849 (= res!659013 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30331 _keys!1544))))))

(declare-fun b!984850 () Bool)

(declare-fun e!555173 () Bool)

(assert (=> b!984850 (= e!555169 (and e!555173 mapRes!36536))))

(declare-fun condMapEmpty!36536 () Bool)

(declare-fun mapDefault!36536 () ValueCell!11021)

