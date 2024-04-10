; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132608 () Bool)

(assert start!132608)

(declare-fun b!1554471 () Bool)

(declare-fun e!865586 () Bool)

(declare-fun e!865584 () Bool)

(assert (=> b!1554471 (= e!865586 (not e!865584))))

(declare-fun res!1063803 () Bool)

(assert (=> b!1554471 (=> res!1063803 e!865584)))

(declare-datatypes ((B!2246 0))(
  ( (B!2247 (val!19209 Int)) )
))
(declare-datatypes ((tuple2!24794 0))(
  ( (tuple2!24795 (_1!12408 (_ BitVec 64)) (_2!12408 B!2246)) )
))
(declare-datatypes ((List!36243 0))(
  ( (Nil!36240) (Cons!36239 (h!37685 tuple2!24794) (t!50964 List!36243)) )
))
(declare-datatypes ((ListLongMap!22403 0))(
  ( (ListLongMap!22404 (toList!11217 List!36243)) )
))
(declare-fun lm!249 () ListLongMap!22403)

(declare-fun isStrictlySorted!905 (List!36243) Bool)

(assert (=> b!1554471 (= res!1063803 (not (isStrictlySorted!905 (toList!11217 lm!249))))))

(declare-fun e!865583 () Bool)

(assert (=> b!1554471 e!865583))

(declare-fun res!1063806 () Bool)

(assert (=> b!1554471 (=> (not res!1063806) (not e!865583))))

(declare-fun lt!670029 () List!36243)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!776 (List!36243 (_ BitVec 64)) Bool)

(assert (=> b!1554471 (= res!1063806 (containsKey!776 lt!670029 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2246)

(declare-fun insertStrictlySorted!516 (List!36243 (_ BitVec 64) B!2246) List!36243)

(assert (=> b!1554471 (= lt!670029 (insertStrictlySorted!516 (toList!11217 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51794 0))(
  ( (Unit!51795) )
))
(declare-fun lt!670031 () Unit!51794)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (List!36243 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51794)

(assert (=> b!1554471 (= lt!670031 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11217 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1554472 () Bool)

(declare-fun e!865585 () Bool)

(declare-fun tp!112200 () Bool)

(assert (=> b!1554472 (= e!865585 tp!112200)))

(declare-fun res!1063807 () Bool)

(assert (=> start!132608 (=> (not res!1063807) (not e!865586))))

(declare-fun contains!10165 (ListLongMap!22403 (_ BitVec 64)) Bool)

(assert (=> start!132608 (= res!1063807 (contains!10165 lm!249 a0!49))))

(assert (=> start!132608 e!865586))

(declare-fun inv!57351 (ListLongMap!22403) Bool)

(assert (=> start!132608 (and (inv!57351 lm!249) e!865585)))

(assert (=> start!132608 true))

(declare-fun tp_is_empty!38257 () Bool)

(assert (=> start!132608 tp_is_empty!38257))

(declare-fun b!1554473 () Bool)

(declare-fun apply!1113 (ListLongMap!22403 (_ BitVec 64)) B!2246)

(declare-fun +!5015 (ListLongMap!22403 tuple2!24794) ListLongMap!22403)

(assert (=> b!1554473 (= e!865584 (= (apply!1113 (+!5015 lm!249 (tuple2!24795 a!523 b!96)) a0!49) (apply!1113 lm!249 a0!49)))))

(declare-datatypes ((Option!830 0))(
  ( (Some!829 (v!22014 B!2246)) (None!828) )
))
(declare-fun isDefined!567 (Option!830) Bool)

(declare-fun getValueByKey!754 (List!36243 (_ BitVec 64)) Option!830)

(assert (=> b!1554473 (isDefined!567 (getValueByKey!754 (toList!11217 lm!249) a0!49))))

(declare-fun lt!670030 () Unit!51794)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!519 (List!36243 (_ BitVec 64)) Unit!51794)

(assert (=> b!1554473 (= lt!670030 (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11217 lm!249) a0!49))))

(declare-fun b!1554474 () Bool)

(declare-fun res!1063805 () Bool)

(assert (=> b!1554474 (=> (not res!1063805) (not e!865586))))

(assert (=> b!1554474 (= res!1063805 (not (= a0!49 a!523)))))

(declare-fun b!1554475 () Bool)

(assert (=> b!1554475 (= e!865583 (= (getValueByKey!754 lt!670029 a0!49) (getValueByKey!754 (toList!11217 lm!249) a0!49)))))

(declare-fun b!1554476 () Bool)

(declare-fun res!1063804 () Bool)

(assert (=> b!1554476 (=> (not res!1063804) (not e!865586))))

(assert (=> b!1554476 (= res!1063804 (containsKey!776 (toList!11217 lm!249) a0!49))))

(assert (= (and start!132608 res!1063807) b!1554474))

(assert (= (and b!1554474 res!1063805) b!1554476))

(assert (= (and b!1554476 res!1063804) b!1554471))

(assert (= (and b!1554471 res!1063806) b!1554475))

(assert (= (and b!1554471 (not res!1063803)) b!1554473))

(assert (= start!132608 b!1554472))

(declare-fun m!1432773 () Bool)

(assert (=> b!1554473 m!1432773))

(declare-fun m!1432775 () Bool)

(assert (=> b!1554473 m!1432775))

(declare-fun m!1432777 () Bool)

(assert (=> b!1554473 m!1432777))

(assert (=> b!1554473 m!1432775))

(declare-fun m!1432779 () Bool)

(assert (=> b!1554473 m!1432779))

(declare-fun m!1432781 () Bool)

(assert (=> b!1554473 m!1432781))

(assert (=> b!1554473 m!1432777))

(declare-fun m!1432783 () Bool)

(assert (=> b!1554473 m!1432783))

(declare-fun m!1432785 () Bool)

(assert (=> b!1554471 m!1432785))

(declare-fun m!1432787 () Bool)

(assert (=> b!1554471 m!1432787))

(declare-fun m!1432789 () Bool)

(assert (=> b!1554471 m!1432789))

(declare-fun m!1432791 () Bool)

(assert (=> b!1554471 m!1432791))

(declare-fun m!1432793 () Bool)

(assert (=> b!1554476 m!1432793))

(declare-fun m!1432795 () Bool)

(assert (=> b!1554475 m!1432795))

(assert (=> b!1554475 m!1432775))

(declare-fun m!1432797 () Bool)

(assert (=> start!132608 m!1432797))

(declare-fun m!1432799 () Bool)

(assert (=> start!132608 m!1432799))

(push 1)

(assert (not b!1554475))

(assert (not b!1554476))

(assert (not b!1554472))

(assert tp_is_empty!38257)

(assert (not b!1554471))

(assert (not start!132608))

(assert (not b!1554473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161761 () Bool)

(declare-fun res!1063848 () Bool)

(declare-fun e!865627 () Bool)

(assert (=> d!161761 (=> res!1063848 e!865627)))

(assert (=> d!161761 (= res!1063848 (and (is-Cons!36239 (toList!11217 lm!249)) (= (_1!12408 (h!37685 (toList!11217 lm!249))) a0!49)))))

(assert (=> d!161761 (= (containsKey!776 (toList!11217 lm!249) a0!49) e!865627)))

(declare-fun b!1554535 () Bool)

(declare-fun e!865628 () Bool)

(assert (=> b!1554535 (= e!865627 e!865628)))

(declare-fun res!1063849 () Bool)

(assert (=> b!1554535 (=> (not res!1063849) (not e!865628))))

(assert (=> b!1554535 (= res!1063849 (and (or (not (is-Cons!36239 (toList!11217 lm!249))) (bvsle (_1!12408 (h!37685 (toList!11217 lm!249))) a0!49)) (is-Cons!36239 (toList!11217 lm!249)) (bvslt (_1!12408 (h!37685 (toList!11217 lm!249))) a0!49)))))

(declare-fun b!1554536 () Bool)

(assert (=> b!1554536 (= e!865628 (containsKey!776 (t!50964 (toList!11217 lm!249)) a0!49))))

(assert (= (and d!161761 (not res!1063848)) b!1554535))

(assert (= (and b!1554535 res!1063849) b!1554536))

(declare-fun m!1432861 () Bool)

(assert (=> b!1554536 m!1432861))

(assert (=> b!1554476 d!161761))

(declare-fun d!161767 () Bool)

(declare-fun res!1063856 () Bool)

(declare-fun e!865639 () Bool)

(assert (=> d!161767 (=> res!1063856 e!865639)))

(assert (=> d!161767 (= res!1063856 (or (is-Nil!36240 (toList!11217 lm!249)) (is-Nil!36240 (t!50964 (toList!11217 lm!249)))))))

(assert (=> d!161767 (= (isStrictlySorted!905 (toList!11217 lm!249)) e!865639)))

(declare-fun b!1554551 () Bool)

(declare-fun e!865640 () Bool)

(assert (=> b!1554551 (= e!865639 e!865640)))

(declare-fun res!1063857 () Bool)

(assert (=> b!1554551 (=> (not res!1063857) (not e!865640))))

(assert (=> b!1554551 (= res!1063857 (bvslt (_1!12408 (h!37685 (toList!11217 lm!249))) (_1!12408 (h!37685 (t!50964 (toList!11217 lm!249))))))))

(declare-fun b!1554552 () Bool)

(assert (=> b!1554552 (= e!865640 (isStrictlySorted!905 (t!50964 (toList!11217 lm!249))))))

(assert (= (and d!161767 (not res!1063856)) b!1554551))

(assert (= (and b!1554551 res!1063857) b!1554552))

(declare-fun m!1432865 () Bool)

(assert (=> b!1554552 m!1432865))

(assert (=> b!1554471 d!161767))

(declare-fun d!161771 () Bool)

(declare-fun res!1063858 () Bool)

(declare-fun e!865641 () Bool)

(assert (=> d!161771 (=> res!1063858 e!865641)))

(assert (=> d!161771 (= res!1063858 (and (is-Cons!36239 lt!670029) (= (_1!12408 (h!37685 lt!670029)) a0!49)))))

(assert (=> d!161771 (= (containsKey!776 lt!670029 a0!49) e!865641)))

(declare-fun b!1554553 () Bool)

(declare-fun e!865642 () Bool)

(assert (=> b!1554553 (= e!865641 e!865642)))

(declare-fun res!1063859 () Bool)

(assert (=> b!1554553 (=> (not res!1063859) (not e!865642))))

(assert (=> b!1554553 (= res!1063859 (and (or (not (is-Cons!36239 lt!670029)) (bvsle (_1!12408 (h!37685 lt!670029)) a0!49)) (is-Cons!36239 lt!670029) (bvslt (_1!12408 (h!37685 lt!670029)) a0!49)))))

(declare-fun b!1554554 () Bool)

(assert (=> b!1554554 (= e!865642 (containsKey!776 (t!50964 lt!670029) a0!49))))

(assert (= (and d!161771 (not res!1063858)) b!1554553))

(assert (= (and b!1554553 res!1063859) b!1554554))

(declare-fun m!1432867 () Bool)

(assert (=> b!1554554 m!1432867))

(assert (=> b!1554471 d!161771))

(declare-fun b!1554603 () Bool)

(declare-fun lt!670078 () List!36243)

(declare-fun e!865672 () Bool)

(declare-fun contains!10168 (List!36243 tuple2!24794) Bool)

(assert (=> b!1554603 (= e!865672 (contains!10168 lt!670078 (tuple2!24795 a!523 b!96)))))

(declare-fun bm!71431 () Bool)

(declare-fun call!71434 () List!36243)

(declare-fun call!71435 () List!36243)

(assert (=> bm!71431 (= call!71434 call!71435)))

(declare-fun bm!71432 () Bool)

(declare-fun call!71436 () List!36243)

(assert (=> bm!71432 (= call!71436 call!71434)))

(declare-fun b!1554604 () Bool)

(declare-fun res!1063885 () Bool)

(assert (=> b!1554604 (=> (not res!1063885) (not e!865672))))

(assert (=> b!1554604 (= res!1063885 (containsKey!776 lt!670078 a!523))))

(declare-fun b!1554605 () Bool)

(declare-fun e!865673 () List!36243)

(assert (=> b!1554605 (= e!865673 call!71436)))

(declare-fun b!1554606 () Bool)

(declare-fun e!865674 () List!36243)

(assert (=> b!1554606 (= e!865674 call!71435)))

(declare-fun b!1554607 () Bool)

(assert (=> b!1554607 (= e!865673 call!71436)))

(declare-fun b!1554608 () Bool)

(declare-fun c!143445 () Bool)

(assert (=> b!1554608 (= c!143445 (and (is-Cons!36239 (toList!11217 lm!249)) (bvsgt (_1!12408 (h!37685 (toList!11217 lm!249))) a!523)))))

(declare-fun e!865676 () List!36243)

(assert (=> b!1554608 (= e!865676 e!865673)))

(declare-fun b!1554609 () Bool)

(assert (=> b!1554609 (= e!865674 e!865676)))

(declare-fun c!143443 () Bool)

(assert (=> b!1554609 (= c!143443 (and (is-Cons!36239 (toList!11217 lm!249)) (= (_1!12408 (h!37685 (toList!11217 lm!249))) a!523)))))

(declare-fun d!161773 () Bool)

(assert (=> d!161773 e!865672))

(declare-fun res!1063884 () Bool)

(assert (=> d!161773 (=> (not res!1063884) (not e!865672))))

(assert (=> d!161773 (= res!1063884 (isStrictlySorted!905 lt!670078))))

(assert (=> d!161773 (= lt!670078 e!865674)))

(declare-fun c!143444 () Bool)

(assert (=> d!161773 (= c!143444 (and (is-Cons!36239 (toList!11217 lm!249)) (bvslt (_1!12408 (h!37685 (toList!11217 lm!249))) a!523)))))

(assert (=> d!161773 (isStrictlySorted!905 (toList!11217 lm!249))))

(assert (=> d!161773 (= (insertStrictlySorted!516 (toList!11217 lm!249) a!523 b!96) lt!670078)))

(declare-fun e!865675 () List!36243)

(declare-fun bm!71433 () Bool)

(declare-fun $colon$colon!951 (List!36243 tuple2!24794) List!36243)

(assert (=> bm!71433 (= call!71435 ($colon$colon!951 e!865675 (ite c!143444 (h!37685 (toList!11217 lm!249)) (tuple2!24795 a!523 b!96))))))

(declare-fun c!143446 () Bool)

(assert (=> bm!71433 (= c!143446 c!143444)))

(declare-fun b!1554610 () Bool)

(assert (=> b!1554610 (= e!865676 call!71434)))

(declare-fun b!1554611 () Bool)

(assert (=> b!1554611 (= e!865675 (ite c!143443 (t!50964 (toList!11217 lm!249)) (ite c!143445 (Cons!36239 (h!37685 (toList!11217 lm!249)) (t!50964 (toList!11217 lm!249))) Nil!36240)))))

(declare-fun b!1554612 () Bool)

(assert (=> b!1554612 (= e!865675 (insertStrictlySorted!516 (t!50964 (toList!11217 lm!249)) a!523 b!96))))

(assert (= (and d!161773 c!143444) b!1554606))

(assert (= (and d!161773 (not c!143444)) b!1554609))

(assert (= (and b!1554609 c!143443) b!1554610))

(assert (= (and b!1554609 (not c!143443)) b!1554608))

(assert (= (and b!1554608 c!143445) b!1554605))

(assert (= (and b!1554608 (not c!143445)) b!1554607))

(assert (= (or b!1554605 b!1554607) bm!71432))

(assert (= (or b!1554610 bm!71432) bm!71431))

(assert (= (or b!1554606 bm!71431) bm!71433))

(assert (= (and bm!71433 c!143446) b!1554612))

(assert (= (and bm!71433 (not c!143446)) b!1554611))

(assert (= (and d!161773 res!1063884) b!1554604))

(assert (= (and b!1554604 res!1063885) b!1554603))

(declare-fun m!1432905 () Bool)

(assert (=> bm!71433 m!1432905))

(declare-fun m!1432907 () Bool)

(assert (=> b!1554603 m!1432907))

(declare-fun m!1432909 () Bool)

(assert (=> b!1554612 m!1432909))

(declare-fun m!1432911 () Bool)

(assert (=> d!161773 m!1432911))

(assert (=> d!161773 m!1432785))

(declare-fun m!1432913 () Bool)

(assert (=> b!1554604 m!1432913))

(assert (=> b!1554471 d!161773))

(declare-fun d!161797 () Bool)

(declare-fun e!865694 () Bool)

(assert (=> d!161797 e!865694))

(declare-fun res!1063902 () Bool)

(assert (=> d!161797 (=> (not res!1063902) (not e!865694))))

(assert (=> d!161797 (= res!1063902 (= (containsKey!776 (insertStrictlySorted!516 (toList!11217 lm!249) a!523 b!96) a0!49) (containsKey!776 (toList!11217 lm!249) a0!49)))))

(declare-fun lt!670097 () Unit!51794)

(declare-fun choose!2051 (List!36243 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51794)

(assert (=> d!161797 (= lt!670097 (choose!2051 (toList!11217 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865695 () Bool)

(assert (=> d!161797 e!865695))

(declare-fun res!1063901 () Bool)

(assert (=> d!161797 (=> (not res!1063901) (not e!865695))))

(assert (=> d!161797 (= res!1063901 (isStrictlySorted!905 (toList!11217 lm!249)))))

(assert (=> d!161797 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11217 lm!249) a!523 b!96 a0!49) lt!670097)))

(declare-fun b!1554634 () Bool)

(assert (=> b!1554634 (= e!865695 (not (= a!523 a0!49)))))

(declare-fun b!1554635 () Bool)

(assert (=> b!1554635 (= e!865694 (= (getValueByKey!754 (insertStrictlySorted!516 (toList!11217 lm!249) a!523 b!96) a0!49) (getValueByKey!754 (toList!11217 lm!249) a0!49)))))

(assert (= (and d!161797 res!1063901) b!1554634))

(assert (= (and d!161797 res!1063902) b!1554635))

(assert (=> d!161797 m!1432789))

(declare-fun m!1432929 () Bool)

(assert (=> d!161797 m!1432929))

(assert (=> d!161797 m!1432793))

(assert (=> d!161797 m!1432785))

(declare-fun m!1432931 () Bool)

(assert (=> d!161797 m!1432931))

(assert (=> d!161797 m!1432789))

(assert (=> b!1554635 m!1432789))

(assert (=> b!1554635 m!1432789))

(declare-fun m!1432933 () Bool)

(assert (=> b!1554635 m!1432933))

(assert (=> b!1554635 m!1432775))

(assert (=> b!1554471 d!161797))

(declare-fun b!1554660 () Bool)

(declare-fun e!865711 () Option!830)

(assert (=> b!1554660 (= e!865711 (getValueByKey!754 (t!50964 lt!670029) a0!49))))

(declare-fun d!161805 () Bool)

(declare-fun c!143458 () Bool)

(assert (=> d!161805 (= c!143458 (and (is-Cons!36239 lt!670029) (= (_1!12408 (h!37685 lt!670029)) a0!49)))))

(declare-fun e!865710 () Option!830)

(assert (=> d!161805 (= (getValueByKey!754 lt!670029 a0!49) e!865710)))

(declare-fun b!1554661 () Bool)

(assert (=> b!1554661 (= e!865711 None!828)))

(declare-fun b!1554659 () Bool)

(assert (=> b!1554659 (= e!865710 e!865711)))

(declare-fun c!143459 () Bool)

(assert (=> b!1554659 (= c!143459 (and (is-Cons!36239 lt!670029) (not (= (_1!12408 (h!37685 lt!670029)) a0!49))))))

(declare-fun b!1554658 () Bool)

(assert (=> b!1554658 (= e!865710 (Some!829 (_2!12408 (h!37685 lt!670029))))))

(assert (= (and d!161805 c!143458) b!1554658))

(assert (= (and d!161805 (not c!143458)) b!1554659))

(assert (= (and b!1554659 c!143459) b!1554660))

(assert (= (and b!1554659 (not c!143459)) b!1554661))

(declare-fun m!1432937 () Bool)

(assert (=> b!1554660 m!1432937))

(assert (=> b!1554475 d!161805))

(declare-fun b!1554670 () Bool)

(declare-fun e!865717 () Option!830)

(assert (=> b!1554670 (= e!865717 (getValueByKey!754 (t!50964 (toList!11217 lm!249)) a0!49))))

(declare-fun d!161811 () Bool)

(declare-fun c!143462 () Bool)

(assert (=> d!161811 (= c!143462 (and (is-Cons!36239 (toList!11217 lm!249)) (= (_1!12408 (h!37685 (toList!11217 lm!249))) a0!49)))))

(declare-fun e!865716 () Option!830)

(assert (=> d!161811 (= (getValueByKey!754 (toList!11217 lm!249) a0!49) e!865716)))

(declare-fun b!1554671 () Bool)

(assert (=> b!1554671 (= e!865717 None!828)))

(declare-fun b!1554669 () Bool)

(assert (=> b!1554669 (= e!865716 e!865717)))

(declare-fun c!143463 () Bool)

(assert (=> b!1554669 (= c!143463 (and (is-Cons!36239 (toList!11217 lm!249)) (not (= (_1!12408 (h!37685 (toList!11217 lm!249))) a0!49))))))

(declare-fun b!1554668 () Bool)

(assert (=> b!1554668 (= e!865716 (Some!829 (_2!12408 (h!37685 (toList!11217 lm!249)))))))

(assert (= (and d!161811 c!143462) b!1554668))

(assert (= (and d!161811 (not c!143462)) b!1554669))

(assert (= (and b!1554669 c!143463) b!1554670))

(assert (= (and b!1554669 (not c!143463)) b!1554671))

(declare-fun m!1432941 () Bool)

(assert (=> b!1554670 m!1432941))

(assert (=> b!1554475 d!161811))

(declare-fun d!161815 () Bool)

(declare-fun e!865732 () Bool)

(assert (=> d!161815 e!865732))

(declare-fun res!1063919 () Bool)

(assert (=> d!161815 (=> res!1063919 e!865732)))

(declare-fun lt!670111 () Bool)

(assert (=> d!161815 (= res!1063919 (not lt!670111))))

(declare-fun lt!670110 () Bool)

(assert (=> d!161815 (= lt!670111 lt!670110)))

(declare-fun lt!670112 () Unit!51794)

(declare-fun e!865731 () Unit!51794)

(assert (=> d!161815 (= lt!670112 e!865731)))

(declare-fun c!143472 () Bool)

(assert (=> d!161815 (= c!143472 lt!670110)))

(assert (=> d!161815 (= lt!670110 (containsKey!776 (toList!11217 lm!249) a0!49))))

(assert (=> d!161815 (= (contains!10165 lm!249 a0!49) lt!670111)))

(declare-fun b!1554696 () Bool)

(declare-fun lt!670109 () Unit!51794)

(assert (=> b!1554696 (= e!865731 lt!670109)))

(assert (=> b!1554696 (= lt!670109 (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11217 lm!249) a0!49))))

(assert (=> b!1554696 (isDefined!567 (getValueByKey!754 (toList!11217 lm!249) a0!49))))

(declare-fun b!1554697 () Bool)

(declare-fun Unit!51801 () Unit!51794)

(assert (=> b!1554697 (= e!865731 Unit!51801)))

(declare-fun b!1554698 () Bool)

(assert (=> b!1554698 (= e!865732 (isDefined!567 (getValueByKey!754 (toList!11217 lm!249) a0!49)))))

(assert (= (and d!161815 c!143472) b!1554696))

(assert (= (and d!161815 (not c!143472)) b!1554697))

(assert (= (and d!161815 (not res!1063919)) b!1554698))

(assert (=> d!161815 m!1432793))

(assert (=> b!1554696 m!1432781))

(assert (=> b!1554696 m!1432775))

(assert (=> b!1554696 m!1432775))

(assert (=> b!1554696 m!1432779))

(assert (=> b!1554698 m!1432775))

(assert (=> b!1554698 m!1432775))

(assert (=> b!1554698 m!1432779))

(assert (=> start!132608 d!161815))

(declare-fun d!161817 () Bool)

(assert (=> d!161817 (= (inv!57351 lm!249) (isStrictlySorted!905 (toList!11217 lm!249)))))

(declare-fun bs!44694 () Bool)

(assert (= bs!44694 d!161817))

(assert (=> bs!44694 m!1432785))

(assert (=> start!132608 d!161817))

(assert (=> b!1554473 d!161811))

(declare-fun d!161821 () Bool)

(declare-fun isEmpty!1140 (Option!830) Bool)

(assert (=> d!161821 (= (isDefined!567 (getValueByKey!754 (toList!11217 lm!249) a0!49)) (not (isEmpty!1140 (getValueByKey!754 (toList!11217 lm!249) a0!49))))))

(declare-fun bs!44695 () Bool)

(assert (= bs!44695 d!161821))

(assert (=> bs!44695 m!1432775))

(declare-fun m!1432953 () Bool)

(assert (=> bs!44695 m!1432953))

(assert (=> b!1554473 d!161821))

(declare-fun d!161823 () Bool)

(assert (=> d!161823 (isDefined!567 (getValueByKey!754 (toList!11217 lm!249) a0!49))))

(declare-fun lt!670119 () Unit!51794)

(declare-fun choose!2052 (List!36243 (_ BitVec 64)) Unit!51794)

(assert (=> d!161823 (= lt!670119 (choose!2052 (toList!11217 lm!249) a0!49))))

(declare-fun e!865747 () Bool)

(assert (=> d!161823 e!865747))

(declare-fun res!1063928 () Bool)

(assert (=> d!161823 (=> (not res!1063928) (not e!865747))))

(assert (=> d!161823 (= res!1063928 (isStrictlySorted!905 (toList!11217 lm!249)))))

(assert (=> d!161823 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11217 lm!249) a0!49) lt!670119)))

(declare-fun b!1554723 () Bool)

(assert (=> b!1554723 (= e!865747 (containsKey!776 (toList!11217 lm!249) a0!49))))

(assert (= (and d!161823 res!1063928) b!1554723))

(assert (=> d!161823 m!1432775))

(assert (=> d!161823 m!1432775))

(assert (=> d!161823 m!1432779))

(declare-fun m!1432955 () Bool)

(assert (=> d!161823 m!1432955))

(assert (=> d!161823 m!1432785))

(assert (=> b!1554723 m!1432793))

(assert (=> b!1554473 d!161823))

(declare-fun d!161825 () Bool)

(declare-fun get!26062 (Option!830) B!2246)

(assert (=> d!161825 (= (apply!1113 lm!249 a0!49) (get!26062 (getValueByKey!754 (toList!11217 lm!249) a0!49)))))

(declare-fun bs!44696 () Bool)

(assert (= bs!44696 d!161825))

(assert (=> bs!44696 m!1432775))

(assert (=> bs!44696 m!1432775))

(declare-fun m!1432957 () Bool)

(assert (=> bs!44696 m!1432957))

(assert (=> b!1554473 d!161825))

(declare-fun d!161827 () Bool)

(assert (=> d!161827 (= (apply!1113 (+!5015 lm!249 (tuple2!24795 a!523 b!96)) a0!49) (get!26062 (getValueByKey!754 (toList!11217 (+!5015 lm!249 (tuple2!24795 a!523 b!96))) a0!49)))))

(declare-fun bs!44697 () Bool)

(assert (= bs!44697 d!161827))

(declare-fun m!1432959 () Bool)

(assert (=> bs!44697 m!1432959))

(assert (=> bs!44697 m!1432959))

(declare-fun m!1432961 () Bool)

(assert (=> bs!44697 m!1432961))

(assert (=> b!1554473 d!161827))

(declare-fun d!161829 () Bool)

(declare-fun e!865777 () Bool)

(assert (=> d!161829 e!865777))

(declare-fun res!1063950 () Bool)

(assert (=> d!161829 (=> (not res!1063950) (not e!865777))))

(declare-fun lt!670146 () ListLongMap!22403)

(assert (=> d!161829 (= res!1063950 (contains!10165 lt!670146 (_1!12408 (tuple2!24795 a!523 b!96))))))

(declare-fun lt!670148 () List!36243)

(assert (=> d!161829 (= lt!670146 (ListLongMap!22404 lt!670148))))

(declare-fun lt!670147 () Unit!51794)

(declare-fun lt!670145 () Unit!51794)

(assert (=> d!161829 (= lt!670147 lt!670145)))

(assert (=> d!161829 (= (getValueByKey!754 lt!670148 (_1!12408 (tuple2!24795 a!523 b!96))) (Some!829 (_2!12408 (tuple2!24795 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!380 (List!36243 (_ BitVec 64) B!2246) Unit!51794)

(assert (=> d!161829 (= lt!670145 (lemmaContainsTupThenGetReturnValue!380 lt!670148 (_1!12408 (tuple2!24795 a!523 b!96)) (_2!12408 (tuple2!24795 a!523 b!96))))))

(assert (=> d!161829 (= lt!670148 (insertStrictlySorted!516 (toList!11217 lm!249) (_1!12408 (tuple2!24795 a!523 b!96)) (_2!12408 (tuple2!24795 a!523 b!96))))))

(assert (=> d!161829 (= (+!5015 lm!249 (tuple2!24795 a!523 b!96)) lt!670146)))

(declare-fun b!1554767 () Bool)

(declare-fun res!1063951 () Bool)

(assert (=> b!1554767 (=> (not res!1063951) (not e!865777))))

(assert (=> b!1554767 (= res!1063951 (= (getValueByKey!754 (toList!11217 lt!670146) (_1!12408 (tuple2!24795 a!523 b!96))) (Some!829 (_2!12408 (tuple2!24795 a!523 b!96)))))))

(declare-fun b!1554768 () Bool)

(assert (=> b!1554768 (= e!865777 (contains!10168 (toList!11217 lt!670146) (tuple2!24795 a!523 b!96)))))

(assert (= (and d!161829 res!1063950) b!1554767))

(assert (= (and b!1554767 res!1063951) b!1554768))

(declare-fun m!1432989 () Bool)

(assert (=> d!161829 m!1432989))

(declare-fun m!1432991 () Bool)

(assert (=> d!161829 m!1432991))

(declare-fun m!1432993 () Bool)

(assert (=> d!161829 m!1432993))

(declare-fun m!1432995 () Bool)

(assert (=> d!161829 m!1432995))

(declare-fun m!1432997 () Bool)

(assert (=> b!1554767 m!1432997))

(declare-fun m!1432999 () Bool)

(assert (=> b!1554768 m!1432999))

(assert (=> b!1554473 d!161829))

(declare-fun b!1554779 () Bool)

(declare-fun e!865784 () Bool)

(declare-fun tp!112215 () Bool)

(assert (=> b!1554779 (= e!865784 (and tp_is_empty!38257 tp!112215))))

(assert (=> b!1554472 (= tp!112200 e!865784)))

(assert (= (and b!1554472 (is-Cons!36239 (toList!11217 lm!249))) b!1554779))

(push 1)

(assert (not d!161829))

(assert (not b!1554670))

(assert (not b!1554779))

(assert (not b!1554723))

(assert (not b!1554552))

(assert (not d!161821))

(assert (not b!1554698))

(assert (not b!1554660))

(assert (not b!1554536))

(assert (not b!1554603))

(assert (not bm!71433))

(assert (not d!161827))

(assert tp_is_empty!38257)

(assert (not d!161823))

(assert (not d!161815))

(assert (not d!161817))

(assert (not b!1554635))

(assert (not b!1554696))

(assert (not d!161797))

(assert (not b!1554767))

(assert (not b!1554554))

(assert (not b!1554604))

(assert (not b!1554612))

(assert (not b!1554768))

(assert (not d!161825))

(assert (not d!161773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

