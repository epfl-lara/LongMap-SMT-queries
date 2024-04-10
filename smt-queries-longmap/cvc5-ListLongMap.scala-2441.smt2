; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38464 () Bool)

(assert start!38464)

(declare-fun b!396944 () Bool)

(declare-fun res!227824 () Bool)

(declare-fun e!240131 () Bool)

(assert (=> b!396944 (=> (not res!227824) (not e!240131))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396944 (= res!227824 (validMask!0 mask!1025))))

(declare-fun b!396945 () Bool)

(declare-fun res!227825 () Bool)

(assert (=> b!396945 (=> (not res!227825) (not e!240131))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23679 0))(
  ( (array!23680 (arr!11289 (Array (_ BitVec 32) (_ BitVec 64))) (size!11641 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23679)

(assert (=> b!396945 (= res!227825 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11641 _keys!709))))))

(declare-fun b!396946 () Bool)

(declare-fun e!240129 () Bool)

(assert (=> b!396946 (= e!240131 e!240129)))

(declare-fun res!227821 () Bool)

(assert (=> b!396946 (=> (not res!227821) (not e!240129))))

(declare-fun lt!187229 () array!23679)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23679 (_ BitVec 32)) Bool)

(assert (=> b!396946 (= res!227821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187229 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!396946 (= lt!187229 (array!23680 (store (arr!11289 _keys!709) i!563 k!794) (size!11641 _keys!709)))))

(declare-fun b!396947 () Bool)

(declare-fun res!227822 () Bool)

(assert (=> b!396947 (=> (not res!227822) (not e!240131))))

(declare-fun arrayContainsKey!0 (array!23679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396947 (= res!227822 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16446 () Bool)

(declare-fun mapRes!16446 () Bool)

(declare-fun tp!32241 () Bool)

(declare-fun e!240132 () Bool)

(assert (=> mapNonEmpty!16446 (= mapRes!16446 (and tp!32241 e!240132))))

(declare-datatypes ((V!14283 0))(
  ( (V!14284 (val!4986 Int)) )
))
(declare-datatypes ((ValueCell!4598 0))(
  ( (ValueCellFull!4598 (v!7233 V!14283)) (EmptyCell!4598) )
))
(declare-fun mapRest!16446 () (Array (_ BitVec 32) ValueCell!4598))

(declare-datatypes ((array!23681 0))(
  ( (array!23682 (arr!11290 (Array (_ BitVec 32) ValueCell!4598)) (size!11642 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23681)

(declare-fun mapKey!16446 () (_ BitVec 32))

(declare-fun mapValue!16446 () ValueCell!4598)

(assert (=> mapNonEmpty!16446 (= (arr!11290 _values!549) (store mapRest!16446 mapKey!16446 mapValue!16446))))

(declare-fun b!396948 () Bool)

(declare-fun e!240128 () Bool)

(declare-fun tp_is_empty!9883 () Bool)

(assert (=> b!396948 (= e!240128 tp_is_empty!9883)))

(declare-fun b!396949 () Bool)

(declare-fun res!227820 () Bool)

(assert (=> b!396949 (=> (not res!227820) (not e!240131))))

(assert (=> b!396949 (= res!227820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!227829 () Bool)

(assert (=> start!38464 (=> (not res!227829) (not e!240131))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38464 (= res!227829 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11641 _keys!709))))))

(assert (=> start!38464 e!240131))

(assert (=> start!38464 true))

(declare-fun e!240127 () Bool)

(declare-fun array_inv!8276 (array!23681) Bool)

(assert (=> start!38464 (and (array_inv!8276 _values!549) e!240127)))

(declare-fun array_inv!8277 (array!23679) Bool)

(assert (=> start!38464 (array_inv!8277 _keys!709)))

(declare-fun b!396950 () Bool)

(assert (=> b!396950 (= e!240129 false)))

(declare-fun lt!187228 () Bool)

(declare-datatypes ((List!6537 0))(
  ( (Nil!6534) (Cons!6533 (h!7389 (_ BitVec 64)) (t!11711 List!6537)) )
))
(declare-fun arrayNoDuplicates!0 (array!23679 (_ BitVec 32) List!6537) Bool)

(assert (=> b!396950 (= lt!187228 (arrayNoDuplicates!0 lt!187229 #b00000000000000000000000000000000 Nil!6534))))

(declare-fun b!396951 () Bool)

(declare-fun res!227823 () Bool)

(assert (=> b!396951 (=> (not res!227823) (not e!240131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396951 (= res!227823 (validKeyInArray!0 k!794))))

(declare-fun b!396952 () Bool)

(declare-fun res!227826 () Bool)

(assert (=> b!396952 (=> (not res!227826) (not e!240131))))

(assert (=> b!396952 (= res!227826 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6534))))

(declare-fun mapIsEmpty!16446 () Bool)

(assert (=> mapIsEmpty!16446 mapRes!16446))

(declare-fun b!396953 () Bool)

(declare-fun res!227827 () Bool)

(assert (=> b!396953 (=> (not res!227827) (not e!240131))))

(assert (=> b!396953 (= res!227827 (or (= (select (arr!11289 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11289 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396954 () Bool)

(assert (=> b!396954 (= e!240127 (and e!240128 mapRes!16446))))

(declare-fun condMapEmpty!16446 () Bool)

(declare-fun mapDefault!16446 () ValueCell!4598)

