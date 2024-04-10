; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38910 () Bool)

(assert start!38910)

(declare-fun b!406937 () Bool)

(declare-fun res!235164 () Bool)

(declare-fun e!244470 () Bool)

(assert (=> b!406937 (=> (not res!235164) (not e!244470))))

(declare-datatypes ((array!24543 0))(
  ( (array!24544 (arr!11721 (Array (_ BitVec 32) (_ BitVec 64))) (size!12073 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24543)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406937 (= res!235164 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17115 () Bool)

(declare-fun mapRes!17115 () Bool)

(assert (=> mapIsEmpty!17115 mapRes!17115))

(declare-fun b!406938 () Bool)

(declare-fun res!235163 () Bool)

(assert (=> b!406938 (=> (not res!235163) (not e!244470))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406938 (= res!235163 (or (= (select (arr!11721 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11721 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406939 () Bool)

(declare-fun e!244469 () Bool)

(declare-fun tp_is_empty!10329 () Bool)

(assert (=> b!406939 (= e!244469 tp_is_empty!10329)))

(declare-fun b!406940 () Bool)

(declare-fun e!244465 () Bool)

(assert (=> b!406940 (= e!244470 e!244465)))

(declare-fun res!235166 () Bool)

(assert (=> b!406940 (=> (not res!235166) (not e!244465))))

(declare-fun lt!188567 () array!24543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24543 (_ BitVec 32)) Bool)

(assert (=> b!406940 (= res!235166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188567 mask!1025))))

(assert (=> b!406940 (= lt!188567 (array!24544 (store (arr!11721 _keys!709) i!563 k0!794) (size!12073 _keys!709)))))

(declare-fun b!406941 () Bool)

(declare-fun res!235167 () Bool)

(assert (=> b!406941 (=> (not res!235167) (not e!244470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406941 (= res!235167 (validKeyInArray!0 k0!794))))

(declare-fun b!406943 () Bool)

(declare-fun res!235158 () Bool)

(assert (=> b!406943 (=> (not res!235158) (not e!244470))))

(assert (=> b!406943 (= res!235158 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12073 _keys!709))))))

(declare-fun b!406944 () Bool)

(declare-fun res!235159 () Bool)

(assert (=> b!406944 (=> (not res!235159) (not e!244470))))

(assert (=> b!406944 (= res!235159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406945 () Bool)

(declare-fun e!244468 () Bool)

(declare-fun e!244466 () Bool)

(assert (=> b!406945 (= e!244468 (and e!244466 mapRes!17115))))

(declare-fun condMapEmpty!17115 () Bool)

(declare-datatypes ((V!14877 0))(
  ( (V!14878 (val!5209 Int)) )
))
(declare-datatypes ((ValueCell!4821 0))(
  ( (ValueCellFull!4821 (v!7456 V!14877)) (EmptyCell!4821) )
))
(declare-datatypes ((array!24545 0))(
  ( (array!24546 (arr!11722 (Array (_ BitVec 32) ValueCell!4821)) (size!12074 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24545)

(declare-fun mapDefault!17115 () ValueCell!4821)

(assert (=> b!406945 (= condMapEmpty!17115 (= (arr!11722 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4821)) mapDefault!17115)))))

(declare-fun b!406946 () Bool)

(assert (=> b!406946 (= e!244466 tp_is_empty!10329)))

(declare-fun mapNonEmpty!17115 () Bool)

(declare-fun tp!33234 () Bool)

(assert (=> mapNonEmpty!17115 (= mapRes!17115 (and tp!33234 e!244469))))

(declare-fun mapKey!17115 () (_ BitVec 32))

(declare-fun mapRest!17115 () (Array (_ BitVec 32) ValueCell!4821))

(declare-fun mapValue!17115 () ValueCell!4821)

(assert (=> mapNonEmpty!17115 (= (arr!11722 _values!549) (store mapRest!17115 mapKey!17115 mapValue!17115))))

(declare-fun b!406947 () Bool)

(declare-fun res!235165 () Bool)

(assert (=> b!406947 (=> (not res!235165) (not e!244470))))

(declare-datatypes ((List!6803 0))(
  ( (Nil!6800) (Cons!6799 (h!7655 (_ BitVec 64)) (t!11977 List!6803)) )
))
(declare-fun arrayNoDuplicates!0 (array!24543 (_ BitVec 32) List!6803) Bool)

(assert (=> b!406947 (= res!235165 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6800))))

(declare-fun res!235160 () Bool)

(assert (=> start!38910 (=> (not res!235160) (not e!244470))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38910 (= res!235160 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12073 _keys!709))))))

(assert (=> start!38910 e!244470))

(assert (=> start!38910 true))

(declare-fun array_inv!8556 (array!24545) Bool)

(assert (=> start!38910 (and (array_inv!8556 _values!549) e!244468)))

(declare-fun array_inv!8557 (array!24543) Bool)

(assert (=> start!38910 (array_inv!8557 _keys!709)))

(declare-fun b!406942 () Bool)

(declare-fun res!235162 () Bool)

(assert (=> b!406942 (=> (not res!235162) (not e!244470))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406942 (= res!235162 (and (= (size!12074 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12073 _keys!709) (size!12074 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406948 () Bool)

(assert (=> b!406948 (= e!244465 false)))

(declare-fun lt!188566 () Bool)

(assert (=> b!406948 (= lt!188566 (arrayNoDuplicates!0 lt!188567 #b00000000000000000000000000000000 Nil!6800))))

(declare-fun b!406949 () Bool)

(declare-fun res!235161 () Bool)

(assert (=> b!406949 (=> (not res!235161) (not e!244470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406949 (= res!235161 (validMask!0 mask!1025))))

(assert (= (and start!38910 res!235160) b!406949))

(assert (= (and b!406949 res!235161) b!406942))

(assert (= (and b!406942 res!235162) b!406944))

(assert (= (and b!406944 res!235159) b!406947))

(assert (= (and b!406947 res!235165) b!406943))

(assert (= (and b!406943 res!235158) b!406941))

(assert (= (and b!406941 res!235167) b!406938))

(assert (= (and b!406938 res!235163) b!406937))

(assert (= (and b!406937 res!235164) b!406940))

(assert (= (and b!406940 res!235166) b!406948))

(assert (= (and b!406945 condMapEmpty!17115) mapIsEmpty!17115))

(assert (= (and b!406945 (not condMapEmpty!17115)) mapNonEmpty!17115))

(get-info :version)

(assert (= (and mapNonEmpty!17115 ((_ is ValueCellFull!4821) mapValue!17115)) b!406939))

(assert (= (and b!406945 ((_ is ValueCellFull!4821) mapDefault!17115)) b!406946))

(assert (= start!38910 b!406945))

(declare-fun m!398815 () Bool)

(assert (=> b!406949 m!398815))

(declare-fun m!398817 () Bool)

(assert (=> mapNonEmpty!17115 m!398817))

(declare-fun m!398819 () Bool)

(assert (=> start!38910 m!398819))

(declare-fun m!398821 () Bool)

(assert (=> start!38910 m!398821))

(declare-fun m!398823 () Bool)

(assert (=> b!406941 m!398823))

(declare-fun m!398825 () Bool)

(assert (=> b!406937 m!398825))

(declare-fun m!398827 () Bool)

(assert (=> b!406947 m!398827))

(declare-fun m!398829 () Bool)

(assert (=> b!406938 m!398829))

(declare-fun m!398831 () Bool)

(assert (=> b!406948 m!398831))

(declare-fun m!398833 () Bool)

(assert (=> b!406940 m!398833))

(declare-fun m!398835 () Bool)

(assert (=> b!406940 m!398835))

(declare-fun m!398837 () Bool)

(assert (=> b!406944 m!398837))

(check-sat (not start!38910) tp_is_empty!10329 (not b!406949) (not b!406948) (not b!406941) (not mapNonEmpty!17115) (not b!406937) (not b!406944) (not b!406940) (not b!406947))
(check-sat)
